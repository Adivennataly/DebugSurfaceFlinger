## Apa itu SurfaceFlinger?

SurfaceFlinger adalah server komposisi di sistem Android yang menggabungkan berbagai buffer dari aplikasi, widget, dan antarmuka sistem menjadi satu tampilan yang disusun dan dikirim ke layar.

Ini bertanggung jawab untuk menangani tugas-tugas penting seperti mengelola frame buffer, menangani synchronization antar proses grafis, memastikan refresh rate yang optimal, dan mengelola berbagai layer grafis (misalnya, aplikasi, status bar, navigasi, dll).


Fungsi Utama SurfaceFlinger:

Rendering dan Komposisi: SurfaceFlinger mengambil data dari buffer grafis yang dihasilkan oleh aplikasi dan menyusunnya ke dalam satu gambar yang utuh untuk ditampilkan di layar.

Synchronisasi: Mengatur sinkronisasi frame antara aplikasi dan perangkat keras tampilan (Display), misalnya menggunakan teknik V-Sync untuk mencegah tearing.

Pengelolaan Layer: Mengelola berbagai layer aplikasi, sistem, dan widget dengan memastikan bahwa setiap layer ditampilkan dengan benar dan pada waktu yang tepat.

Optimalisasi Performa: Menggunakan akselerasi perangkat keras (GPU) untuk mengoptimalkan kinerja rendering dan meminimalkan latensi.

## Apa itu Debugging SurfaceFlinger?

Debugging SurfaceFlinger adalah proses untuk mendiagnosis, memantau, dan mengoptimalkan kinerja SurfaceFlinger, sebuah komponen penting dalam sistem Android yang bertanggung jawab untuk mengelola semua tampilan grafis di layar.

SurfaceFlinger bertugas mengompilasikan buffer dari berbagai aplikasi atau layer menjadi satu gambar yang kemudian ditampilkan di layar.

Ini adalah bagian integral dari sistem rendering grafis Android, yang menggunakan akselerasi perangkat keras (GPU) untuk memastikan tampilan yang halus dan responsif.


Debugging SurfaceFlinger melibatkan berbagai teknik dan alat untuk memantau, menganalisis, dan mengoptimalkan proses rendering dan komposisi grafis yang dikelola oleh SurfaceFlinger.

## Memantau Kinerja Rendering:

Mengukur dan menganalisis kinerja rendering grafis, seperti frame rate, latensi, dan waktu komposisi.
Menggunakan alat seperti Systrace atau Perfetto untuk mengumpulkan dan memvisualisasikan data kinerja SurfaceFlinger.

Mengidentifikasi dan Memperbaiki Masalah:
Mengidentifikasi masalah seperti frame drop, stuttering, lag, atau tearing pada layar.
Menggunakan log debugging dan statistik kinerja untuk menemukan penyebab masalah, misalnya, masalah sinkronisasi, backlog buffer, atau bottleneck GPU.

Menyesuaikan Pengaturan untuk Optimasi:
Menggunakan berbagai parameter dan properti debugging (seperti yang telah dijelaskan sebelumnya) untuk mengontrol dan mengoptimalkan perilaku SurfaceFlinger.

Properti seperti "debug.sf.early.app.duration", "debug.sf.enable_hwc_vds", dan lainnya memungkinkan pengembang mengontrol aspek seperti timing, cache layer, backpressure, dan penggunaan akselerasi perangkat keras.


## Penjelasan Properti
berikut penjelasan properti Debugging yang berhubungan dengan HWUI dan SurfaceFlinger :


- debug.sf.early.app.duration:

  Properti ini mungkin digunakan untuk mengukur atau mencatat durasi waktu (dalam milidetik) yang dibutuhkan oleh aplikasi untuk melakukan rendering lebih awal dari waktu target untuk frame tertentu. Ini bisa berguna untuk menganalisis berapa lama waktu yang diperlukan aplikasi untuk siap sebelum frame benar-benar ditampilkan di layar.

  Dalam konteks debugging dan pengoptimalan performa grafis, properti ini membantu mengidentifikasi apakah aplikasi memulai proses rendering lebih awal atau cukup waktu untuk memastikan tampilan yang lancar tanpa adanya frame drop (penurunan frame).


- debug.sf.late.app.duration:

  Properti ini mengukur atau mencatat durasi waktu (dalam milidetik) yang dibutuhkan oleh aplikasi ketika rendering terlambat atau melampaui waktu target frame tertentu. Ini berguna untuk mendeteksi frame yang ditampilkan terlambat (frame drops) yang dapat menyebabkan stuttering atau lag dalam animasi atau gameplay.

  Jika durasi ini terlalu lama, pengembang dapat menggunakan informasi ini untuk mengidentifikasi bagian kode atau proses rendering yang menyebabkan keterlambatan dan mengoptimalkan aplikasi agar lebih responsif dan lancar.


- debug.sf.early.sf.duration:

  Properti ini mencatat waktu (dalam milidetik atau mikrodetik) yang diperlukan oleh SurfaceFlinger untuk menyelesaikan tugasnya lebih awal dari waktu yang dijadwalkan untuk menampilkan frame tertentu.

  valuenya menunjukkan seberapa cepat SurfaceFlinger dapat memproses dan mengompilasikan semua buffer untuk frame sebelum batas waktu. value yang lebih rendah menunjukkan kinerja yang baik, di mana SurfaceFlinger mampu menyelesaikan tugas lebih cepat dari waktu yang diharapkan.


- debug.sf.late.sf.duration:

  Properti ini mencatat waktu (dalam milidetik atau mikrodetik) yang diperlukan oleh SurfaceFlinger jika terjadi keterlambatan dalam menyelesaikan tugasnya.

  value yang digunakan menunjukkan seberapa sering atau seberapa lama SurfaceFlinger tertunda dalam melakukan komposisi frame. value yang lebih tinggi biasanya menunjukkan masalah performa, di mana SurfaceFlinger tidak dapat memproses buffer dalam waktu yang cukup singkat untuk mencegah penurunan kualitas tampilan (seperti stuttering atau lag).

- debug.sf.set_idle_timer_ms:

  Properti ini menentukan waktu dalam milidetik setelah SurfaceFlinger akan memasuki mode "idle" (diam) jika tidak ada aktivitas grafis yang terjadi.   Ketika perangkat dalam mode idle, ini menghemat daya dengan menurunkan frekuensi pembaruan layar.
  value ini mengatur berapa lama waktu tunggu setelah tidak ada frame yang diminta untuk ditampilkan.

  Jika valuenya terlalu kecil, perangkat mungkin sering berpindah ke dan dari mode idle, yang bisa berdampak pada efisiensi daya dan performa. value yang lebih tinggi bisa menunda transisi ke mode idle, menjaga layar tetap aktif lebih lama, yang bisa meningkatkan kelancaran animasi tetapi juga mengonsumsi lebih banyak daya.


- debug.sf.hw:

  Properti ini biasanya digunakan untuk mengaktifkan atau menonaktifkan akselerasi perangkat keras untuk SurfaceFlinger. value "1" mengaktifkan akselerasi perangkat keras, sedangkan "0" menonaktifkannya.


- debug.egl.hw:

  Properti ini berkaitan dengan penggunaan akselerasi perangkat keras untuk EGL (OpenGL for Embedded Systems), yang merupakan antarmuka antara rendering OpenGL dan lapisan tampilan.

  Sama seperti debug.sf.hw, nilai "1" mengaktifkan akselerasi perangkat keras dan "0" menonaktifkannya.

  Keduanya digunakan untuk mengontrol penggunaan GPU (Graphics Processing Unit) untuk meningkatkan performa grafis. Akselerasi perangkat keras diaktifkan untuk memberikan kinerja yang lebih baik dalam rendering dan mengurangi beban pada CPU.


- debug.sf.latch_unsignaled:

  Properti ini terkait dengan bagaimana SurfaceFlinger menangani buffer yang belum ditandai sebagai "signaled" atau siap untuk digunakan.
  Jika properti ini diatur, SurfaceFlinger dapat mengambil buffer yang belum ditandai sebagai "siap" (unsignaled) lebih awal, yang bisa mengurangi latensi dalam beberapa kasus.

  Mengaktifkan properti ini bisa memperbaiki masalah latensi grafis, tetapi juga dapat meningkatkan risiko tampilan frame yang belum selesai atau tidak lengkap jika buffer tidak siap tepat waktu.


- debug.sf.high_fps_early_app_phase_offset_ns:
 
  Menentukan offset waktu (dalam nanodetik) untuk fase awal aplikasi dalam mode FPS tinggi.
  Ini mengatur seberapa awal aplikasi harus memulai rendering dalam skenario frame rate tinggi, membantu meminimalkan latensi.

- debug.sf.high_fps_late_app_phase_offset_ns:

  Menentukan offset waktu (dalam nanodetik) untuk fase akhir aplikasi dalam mode FPS tinggi.
  Ini mengatur seberapa terlambat aplikasi dapat menunda rendering dalam skenario frame rate tinggi tanpa menyebabkan masalah tampilan.

  *Kedua properti diatas digunakan untuk mengontrol fase offset aplikasi pada frame rate tinggi.
  Mengoptimalkan nilai-nilai ini memungkinkan pengaturan yang lebih presisi untuk aplikasi yang membutuhkan performa tinggi (seperti game atau aplikasi AR/VR).


- debug.sf.enable_advanced_sf_phase_offset:

  Properti ini digunakan untuk mengaktifkan pengaturan fase offset yang lebih canggih untuk SurfaceFlinger.
  Saat diaktifkan, SurfaceFlinger mungkin menggunakan algoritma atau metode yang lebih kompleks untuk menghitung kapan harus menampilkan frame berdasarkan sinyal input yang diterima.

  Ini memungkinkan optimasi tambahan untuk perangkat dengan kebutuhan tampilan canggih atau aplikasi dengan tuntutan performa tinggi.


- debug.sf.disable_client_composition_cache:

  Properti ini digunakan untuk menonaktifkan caching komposisi client pada SurfaceFlinger.
  Caching ini biasanya digunakan untuk mengurangi beban kerja komposisi dengan menyimpan hasil komposisi sebelumnya yang dapat digunakan kembali.

  Menonaktifkan cache ini mungkin berguna dalam pengembangan atau debugging untuk memastikan bahwa setiap frame digambar ulang sepenuhnya, tetapi biasanya akan meningkatkan beban komposisi dan dapat menyebabkan penurunan performa.


- debug.sf.enable_gl_backpressure:

  Properti ini mengaktifkan mekanisme "backpressure" pada jalur rendering OpenGL.
"Backpressure" berarti SurfaceFlinger akan memberi sinyal ke aplikasi untuk memperlambat rendering jika buffer grafis sudah penuh atau ada backlog.

  Hal ini berguna untuk menghindari situasi di mana aplikasi secara berlebihan mendorong frame yang belum dapat diproses oleh GPU atau SurfaceFlinger, yang bisa menyebabkan latensi tinggi atau konsumsi daya yang berlebihan.

- debug.hwui.renderer:

  Properti ini mengatur jenis renderer yang digunakan oleh HWUI (Hardware UI Rendering) di Android. HWUI adalah sistem rendering GPU yang digunakan untuk merender antarmuka pengguna di aplikasi Android.

   value:
   - opengl : menggunakan OpenGL dan memang digunakan sebagai rendering default untuk HWUI.
   - vulkan : menggunakan Vulkan backend yang lebih efisien terutama untuk Game, namun tidak optimal di banyak perangkat dan aplikasi.
   - skiagl : menggunakan Skia OpenGL backend (Skia adalah versi Lite, lebih ringan)
   - skiavk : menggunakan Skia Vulkan backend (Skia adalah versi Lite, lebih ringan)

  value ini memungkinkan developer atau pengguna untuk memilih antara backend OpenGL atau Vulkan untuk rendering, tergantung pada perangkat dan kebutuhan aplikasi. Vulkan umumnya menawarkan kinerja yang lebih baik dan lebih efisien untuk perangkat modern.


- debug.renderengine.backend:

  Properti ini menentukan backend rendering yang akan digunakan oleh RenderEngine, komponen Android yang menangani tugas-tugas komposisi grafis.

   value:
   - skiagl : menggunakan Skia dengan backend OpenGL yang lebih ringan.
   - skiaglthreaded : menggunakan Skia dengan backend OpenGL dengan dukungan multi-threading.
   - threaded : menggunakan multi-threading tanpa menggunakan jenis rendering spesifik yang digunakan.
   - gles : menggunakan OpenGL ES sebagai backend rendering.
   - vulkan : menggunakan Vulkan sebagai backend rendering.

   Pengaturan ini memungkinkan developer untuk menguji dan mengoptimalkan performa grafis dengan memilih backend yang paling sesuai dengan perangkat keras atau aplikasi tertentu.


- debug.angle.backend:

  Properti ini mengatur backend grafis untuk ANGLE (Almost Native Graphics Layer Engine), sebuah lapisan abstraksi yang memungkinkan aplikasi menggunakan API grafis OpenGL ES di atas backend lain, seperti Direct3D (di Windows) atau Vulkan.

   value:
   - default : menggunakan backend default yang ditentukan oleh ANGLE.
   - d3d11 : menggunakan Direct3D 11 sebagai backend.
   - vulkan : menggunakan Vulkan sebagai backend.

  Ini berguna untuk pengujian lintas platform atau untuk memastikan kompatibilitas grafis yang lebih luas dengan memilih backend yang lebih cocok dengan perangkat keras atau sistem operasi.

- debug.angle.overlay:

  Properti ini mengontrol overlay debugging ANGLE, yang menyediakan informasi tentang konfigurasi dan status rendering ANGLE saat ini.

  value:
  - true : mengaktifkan overlay untuk menampilkan informasi yang dibutuhkan, seperti backend yang digunakan, versi driver, dan statistik rendering.
  - false : menonaktifkan overlay debugging (disarankan).
 
- debug.sf.enable_hwc_vds:

  Properti ini mengaktifkan Hardware Composer Virtual Display Support (HWC VDS). Hardware Composer adalah komponen di Android yang membantu mengelola berbagai layer tampilan menggunakan akselerasi perangkat keras.

  Mengaktifkan properti ini memungkinkan SurfaceFlinger menggunakan layar virtual yang didukung oleh komposer perangkat keras, yang bisa berguna untuk pengujian grafis, debugging, atau situasi di mana layar virtual diperlukan (misalnya, mirroring layar atau virtual reality).

- debug.sf.frame_rate_multiple_threshold:

  Properti ini menentukan ambang batas (threshold) untuk pengaturan multiple frame rate oleh SurfaceFlinger.
  Ini mengatur seberapa besar perbedaan antara frame rate yang diinginkan dan frame rate tampilan aktual agar dianggap signifikan.

  value ini bisa berguna dalam pengaturan tampilan dengan frame rate variabel, membantu memastikan bahwa tampilan selalu disesuaikan dengan frame rate yang paling optimal untuk perangkat dan kondisi aplikasi saat itu.


- debug.sf.disable_backpressure:

  Properti ini menonaktifkan mekanisme backpressure yang biasanya digunakan oleh SurfaceFlinger.
"Backpressure" memberi sinyal kepada aplikasi untuk memperlambat rendering jika buffer grafis sudah penuh atau ada backlog.

  Menonaktifkan backpressure bisa meningkatkan throughput rendering untuk aplikasi yang sangat membutuhkan performa tinggi, tetapi ini juga bisa meningkatkan konsumsi daya dan menyebabkan masalah stabilitas atau latensi jika perangkat keras tidak bisa mengikuti kecepatan rendering aplikasi.


- debug.sf.layer_caching_active_layer_timeout_ms:

  Properti ini menentukan waktu (dalam milidetik) setelah lapisan aktif (active layer) akan dicache atau dihapus dari cache oleh SurfaceFlinger.
  Caching layer bisa meningkatkan kinerja dengan menghindari komposisi ulang frame yang tidak berubah.

  value yang lebih tinggi memungkinkan layer tetap dicache lebih lama, yang bisa menghemat waktu komposisi dan meningkatkan kinerja, tetapi bisa mengonsumsi lebih banyak memori.
  value yang lebih rendah bisa mengurangi penggunaan memori tetapi meningkatkan beban kerja komposisi.


- debug.sf.enable_adpf_cpu_hint:

  Properti ini mengaktifkan ADPF (Android Dynamic Performance Framework) CPU hint. ADPF adalah framework di Android yang digunakan untuk mengoptimalkan performa dan daya dengan memberikan hint kepada CPU untuk meningkatkan atau menurunkan performa berdasarkan beban kerja aplikasi.

  Mengaktifkan properti ini memungkinkan perangkat untuk memberikan hint yang lebih presisi kepada CPU tentang kebutuhan performa, sehingga bisa meningkatkan kinerja atau efisiensi daya, tergantung pada skenario aplikasi.


- debug.hwui.use_hint_manager:

  Properti ini menentukan apakah HWUI (Hardware UI Rendering) menggunakan Hint Manager untuk mengelola hint performa dan daya secara dinamis.

  Menggunakan Hint Manager bisa membantu mengoptimalkan penggunaan sumber daya dengan menyesuaikan kebutuhan grafis dengan kondisi saat ini, seperti performa GPU atau kebutuhan daya perangkat.

## Syarat yang dibutuhkan
properti bersifat debugging, tidak membutuhkan akses root.

- Download file service.sh lalu gunakan terminal (ADB/LADB/Brevent/Termux) untuk menjalankan script file :

      sh /storage/emulated/0/Download/service.sh
  
- untuk pengguna non-root :

      sh /storage/emulated/0/Download/service-nr.sh
  
- bisa juga dengan menambah properti secara manual (copy-paste dari file)
  untuk pengguna non-root harus menggunakan command `setprop debug.hwui.renderer`
  tidak bisa menggunakan `resetprop -n debug.hwui.renderer`

Jika ingin menonaktifkan cukup dengan restart/reboot perangkat karena properti hanya bersifat debugging atau sementara, tidak permanen.

*tidak menyebabkan softbrick ataupun bootloop.

## Pengetesan
 - MIUI 13 Android 12
 - MIUI 14 Android 13
