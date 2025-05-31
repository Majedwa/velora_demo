// lib/presentation/screens/journey/journey_tracking_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/path_model.dart';
import '../../providers/journey_provider.dart';
import '../../widgets/common/custom_app_bar.dart';

class JourneyTrackingScreen extends StatefulWidget {
  final PathModel path;

  const JourneyTrackingScreen({
    super.key,
    required this.path,
  });

  @override
  State<JourneyTrackingScreen> createState() => _JourneyTrackingScreenState();
}

class _JourneyTrackingScreenState extends State<JourneyTrackingScreen> {
  bool _isJourneyStarted = false;
  bool _isJourneyPaused = false;
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;

  @override
  void initState() {
    super.initState();
    _startLocationTracking();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startLocationTracking() {
    final journeyProvider = Provider.of<JourneyProvider>(context, listen: false);
    journeyProvider.startJourney(widget.path);
  }

  void _startJourney() {
    setState(() {
      _isJourneyStarted = true;
      _isJourneyPaused = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isJourneyPaused) {
        setState(() {
          _elapsedTime = Duration(seconds: _elapsedTime.inSeconds + 1);
        });
      }
    });

    final journeyProvider = Provider.of<JourneyProvider>(context, listen: false);
    journeyProvider.resumeJourney();
  }

  void _pauseJourney() {
    setState(() {
      _isJourneyPaused = !_isJourneyPaused;
    });

    final journeyProvider = Provider.of<JourneyProvider>(context, listen: false);
    if (_isJourneyPaused) {
      journeyProvider.pauseJourney();
    } else {
      journeyProvider.resumeJourney();
    }
  }

  void _stopJourney() {
    _timer?.cancel();
    
    final journeyProvider = Provider.of<JourneyProvider>(context, listen: false);
    journeyProvider.stopJourney();

    _showJourneyCompletedDialog();
  }

  void _showJourneyCompletedDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              PhosphorIcons.trophy_fill,
              color: Colors.amber,
              size: 28,
            ),
            const SizedBox(width: 8),
            const Text('تهانينا!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('لقد أكملت الرحلة بنجاح!'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('الوقت المستغرق:'),
                      Text(
                        _formatDuration(_elapsedTime),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('المسافة:'),
                      Text(
                        '${widget.path.length} كم',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // إغلاق الحوار
              Navigator.of(context).pop(); // العودة للصفحة السابقة
            },
            child: const Text('إنهاء'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              // يمكن إضافة مشاركة الإنجاز هنا
            },
            child: const Text('مشاركة'),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.path.nameAr,
        actions: [
          if (_isJourneyStarted)
            IconButton(
              icon: Icon(
                PhosphorIcons.stop_circle,
                color: AppColors.error,
              ),
              onPressed: _stopJourney,
            ),
        ],
      ),
      body: Consumer<JourneyProvider>(
        builder: (context, journeyProvider, child) {
          return Column(
            children: [
              // معلومات الرحلة
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // الوقت المستغرق
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        _formatDuration(_elapsedTime),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // إحصائيات الرحلة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatItem(
                          icon: PhosphorIcons.ruler,
                          label: 'المسافة',
                          value: '${journeyProvider.distanceTraveled.toStringAsFixed(1)} كم',
                        ),
                        _StatItem(
                          icon: PhosphorIcons.gauge,
                          label: 'السرعة',
                          value: '${journeyProvider.currentSpeed.toStringAsFixed(1)} كم/س',
                        ),
                        _StatItem(
                          icon: PhosphorIcons.map_pin,
                          label: 'النقاط',
                          value: '${journeyProvider.visitedCheckpoints}/${widget.path.coordinates.length}',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // الخريطة
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Text(
                          'خريطة تتبع الرحلة\n(سيتم دمجها مع Google Maps)',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // أزرار التحكم
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    if (!_isJourneyStarted) ...[
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _startJourney,
                          icon: const Icon(PhosphorIcons.play),
                          label: const Text('بدء الرحلة'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ] else ...[
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _pauseJourney,
                          icon: Icon(_isJourneyPaused 
                              ? PhosphorIcons.play 
                              : PhosphorIcons.pause),
                          label: Text(_isJourneyPaused ? 'استئناف' : 'إيقاف مؤقت'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _isJourneyPaused 
                                ? AppColors.primary 
                                : AppColors.warning,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _stopJourney,
                          icon: const Icon(PhosphorIcons.stop),
                          label: const Text('إنهاء الرحلة'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.error,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: AppColors.primary,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}