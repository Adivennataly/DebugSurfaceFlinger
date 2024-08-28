# HWUI properties
setprop debug.hwui.renderer vulkan
setprop debug.hwui.use_hint_manager false

# RenderEngine backend
setprop debug.renderengine.backend threaded

# ANGLE backend
setprop debug.angle.backend vulkan

# Debugging SurfaceFlinger
setprop debug.sf.hw 1
setprop debug.sf.early.app.duration 1000000
setprop debug.sf.late.app.duration 1000000
setprop debug.sf.early.sf.duration 1000000
setprop debug.sf.late.sf.duration 1000000
setprop debug.sf.enable_hwc_vds 0
setprop debug.sf.set_idle_timer_ms 1000
setprop debug.sf.latch_unsignaled 1
setprop debug.sf.high_fps_early_app_phase_offset_ns -4000000
setprop debug.sf.high_fps_late_app_phase_offset_ns 1000000
setprop debug.sf.high_fps_early_sf_phase_offset_ns -4000000
setprop debug.sf.high_fps_late_sf_phase_offset_ns 1000000
setprop debug.sf.enable_advanced_sf_phase_offset 1
setprop debug.sf.disable_client_composition_cache 0
setprop debug.sf.enable_gl_backpressure 0
setprop debug.sf.disable_backpressure 1
setprop debug.sf.frame_rate_multiple_threshold 120
setprop debug.sf.layer_caching_active_layer_timeout_ms 1000
setprop debug.sf.enable_adpf_cpu_hint true

# OpenGL Hardware Acceleration
setprop debug.egl.hw 0

sleep 2
echo "success"

# Konfigurasi ini menggunakan Vulkan sebagai rendering backend, dimana dapat menyebabkan masalah pada perangkat yang tidak dioptimalkan untuk Vulkan dan beberapa Aplikasi.
# Konfigurasi ini juga difokuskan untuk performa, dimana tidak efisien untuk penggunaan daily.
