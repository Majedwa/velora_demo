// lib/presentation/screens/journey/journey_tracking_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
<<<<<<< HEAD
import 'package:google_maps_flutter/google_maps_flutter.dart';
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
import 'dart:async';

import '../../../core/constants/app_colors.dart';
import '../../../data/models/path_model.dart';
import '../../providers/journey_provider.dart';
import '../../widgets/common/custom_app_bar.dart';
<<<<<<< HEAD
import 'widgets/journey_completion_dialog.dart';
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10

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
<<<<<<< HEAD
  GoogleMapController? _mapController;
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
  bool _isJourneyStarted = false;
  bool _isJourneyPaused = false;
  Timer? _timer;
  Duration _elapsedTime = Duration.zero;
<<<<<<< HEAD
  
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10

  @override
  void initState() {
    super.initState();
<<<<<<< HEAD
    _setupMapMarkersAndPath();
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
    _startLocationTracking();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

<<<<<<< HEAD
  void _setupMapMarkersAndPath() {
    Set<Marker> markers = {};
    Set<Polyline> polylines = {};

    if (widget.path.coordinates.isNotEmpty) {
      // نقطة البداية
      markers.add(
        Marker(
          markerId: const MarkerId('start'),
          position: LatLng(
            widget.path.coordinates.first.latitude,
            widget.path.coordinates.first.longitude,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
            title: 'نقطة البداية',
            snippet: widget.path.nameAr,
          ),
        ),
      );

      // نقطة النهاية
      if (widget.path.coordinates.length > 1) {
        markers.add(
          Marker(
            markerId: const MarkerId('end'),
            position: LatLng(
              widget.path.coordinates.last.latitude,
              widget.path.coordinates.last.longitude,
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: const InfoWindow(
              title: 'نقطة النهاية',
              snippet: 'الوجهة النهائية',
            ),
          ),
        );
      }

      // خط المسار
      polylines.add(
        Polyline(
          polylineId: const PolylineId('path'),
          points: widget.path.coordinates.map((coord) => 
            LatLng(coord.latitude, coord.longitude)
          ).toList(),
          color: AppColors.primary,
          width: 5,
          patterns: [PatternItem.dash(20), PatternItem.gap(10)],
        ),
      );
    }

    setState(() {
      _markers = markers;
      _polylines = polylines;
    });
  }

=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
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
<<<<<<< HEAD

    // تحريك الكاميرا إلى نقطة البداية
    if (_mapController != null && widget.path.coordinates.isNotEmpty) {
      _mapController!.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(
            widget.path.coordinates.first.latitude,
            widget.path.coordinates.first.longitude,
          ),
          16.0,
        ),
      );
    }
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
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
<<<<<<< HEAD
      builder: (context) => JourneyCompletionDialog(
        path: widget.path,
        elapsedTime: _elapsedTime,
        onComplete: () {
          Navigator.of(context).pop(); // إغلاق الحوار
          Navigator.of(context).pop(); // العودة للصفحة السابقة
        },
=======
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
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
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
<<<<<<< HEAD
              // معلومات الرحلة العلوية
=======
              // معلومات الرحلة
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
<<<<<<< HEAD
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary.withOpacity(0.1),
                      AppColors.primary.withOpacity(0.05),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // الوقت المستغرق مع تصميم محسن
=======
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
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
<<<<<<< HEAD
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                      ),
                      child: Text(
                        _formatDuration(_elapsedTime),
                        style: const TextStyle(
                          color: Colors.white,
<<<<<<< HEAD
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
=======
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                    
                    // إحصائيات الرحلة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatItem(
                          icon: PhosphorIcons.ruler,
                          label: 'المسافة',
                          value: '${journeyProvider.distanceTraveled.toStringAsFixed(1)} كم',
<<<<<<< HEAD
                          color: AppColors.tertiary,
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                        ),
                        _StatItem(
                          icon: PhosphorIcons.gauge,
                          label: 'السرعة',
                          value: '${journeyProvider.currentSpeed.toStringAsFixed(1)} كم/س',
<<<<<<< HEAD
                          color: AppColors.secondary,
                        ),
                        _StatItem(
                          icon: PhosphorIcons.map_pin,
                          label: 'التقدم',
                          value: '${journeyProvider.visitedCheckpoints}/${widget.path.coordinates.length}',
                          color: AppColors.success,
                        ),
                      ],
                    ),
                    
                    // شريط التقدم
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: journeyProvider.getCompletionPercentage(),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [AppColors.primary, AppColors.success],
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${(journeyProvider.getCompletionPercentage() * 100).toStringAsFixed(1)}% مكتمل',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
=======
                        ),
                        _StatItem(
                          icon: PhosphorIcons.map_pin,
                          label: 'النقاط',
                          value: '${journeyProvider.visitedCheckpoints}/${widget.path.coordinates.length}',
                        ),
                      ],
                    ),
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                  ],
                ),
              ),

<<<<<<< HEAD
              // الخريطة مع التحسينات
=======
              // الخريطة
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
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
<<<<<<< HEAD
                    child: GoogleMap(
                      onMapCreated: (controller) {
                        _mapController = controller;
                      },
                      initialCameraPosition: CameraPosition(
                        target: widget.path.coordinates.isNotEmpty
                            ? LatLng(
                                widget.path.coordinates.first.latitude,
                                widget.path.coordinates.first.longitude,
                              )
                            : const LatLng(31.9522, 35.2332),
                        zoom: 14.0,
                      ),
                      markers: _markers,
                      polylines: _polylines,
                      myLocationEnabled: true,
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      compassEnabled: true,
                      rotateGesturesEnabled: true,
                      scrollGesturesEnabled: true,
                      tiltGesturesEnabled: false,
                      zoomGesturesEnabled: true,
=======
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
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
                    ),
                  ),
                ),
              ),

<<<<<<< HEAD
              // أزرار التحكم المحسنة
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Column(
                    children: [
                      if (!_isJourneyStarted) ...[
                        // معلومات المسار قبل البدء
                        Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                PhosphorIcons.info,
                                color: AppColors.primary,
                                size: 24,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'مسار ${widget.path.nameAr}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'المسافة: ${widget.path.length} كم • الوقت المتوقع: ${widget.path.estimatedDuration.inHours} ساعات',
                                      style: TextStyle(
                                        color: AppColors.textSecondary,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton.icon(
                            onPressed: _startJourney,
                            icon: const Icon(PhosphorIcons.play, size: 24),
                            label: const Text(
                              'بدء الرحلة',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              elevation: 3,
                              shadowColor: AppColors.primary.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ),
                      ] else ...[
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 56,
                                child: ElevatedButton.icon(
                                  onPressed: _pauseJourney,
                                  icon: Icon(
                                    _isJourneyPaused 
                                        ? PhosphorIcons.play 
                                        : PhosphorIcons.pause,
                                    size: 20,
                                  ),
                                  label: Text(
                                    _isJourneyPaused ? 'استئناف' : 'إيقاف مؤقت',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _isJourneyPaused 
                                        ? AppColors.primary 
                                        : AppColors.warning,
                                    foregroundColor: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: SizedBox(
                                height: 56,
                                child: ElevatedButton.icon(
                                  onPressed: _stopJourney,
                                  icon: const Icon(PhosphorIcons.stop, size: 20),
                                  label: const Text(
                                    'إنهاء الرحلة',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.error,
                                    foregroundColor: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
=======
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
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
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
<<<<<<< HEAD
  final Color color;
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10

  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
<<<<<<< HEAD
    required this.color,
=======
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
<<<<<<< HEAD
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
=======
        Icon(
          icon,
          color: AppColors.primary,
          size: 24,
>>>>>>> d8716e0eeca8eb3d65ed31d130d527db75d35c10
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