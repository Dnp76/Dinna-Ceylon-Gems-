$images = @{
    "assets/Images/Home/hero-bg.mp4" = "https://videos.pexels.com/video-files/5453621/5453621-hd_1920_1080_25fps.mp4"
    "assets/Images/Home/intro-sapphire.jpg" = "https://images.unsplash.com/photo-1599707367072-cd6ad6cb3d2e?q=80&w=1000"
    "assets/Images/Home/ruby-card.jpg" = "https://images.unsplash.com/photo-1615655406736-b37c4fabf923?q=80&w=800"
    "assets/Images/Home/sapphire-card.jpg" = "https://images.unsplash.com/photo-1618251213426-5b3211516e8b?q=80&w=800"
    "assets/Images/Home/yellow-sapphire-card.jpg" = "https://media.istockphoto.com/id/1148822080/photo/yellow-sapphire.jpg?s=612x612&w=0&k=20&c=N_8qWvKxO7C_bYqJ9e7fQ8g9Z5wX_r4t_x6y3z_p2u8="
    "assets/Images/Home/cta-bg.jpg" = "https://images.unsplash.com/photo-1549480922-0d6e87f2843b?q=80&w=2000"

    "assets/Images/About/header-bg.jpg" = "https://images.unsplash.com/photo-1573408301185-9146fe634ad0?q=80&w=2000"
    "assets/Images/About/mining.jpg" = "https://images.unsplash.com/photo-1627932824900-58800ba7815d?q=80&w=1000"
    "assets/Images/About/ratnapura.jpg" = "https://images.unsplash.com/photo-1548013146-72479768bada?q=80&w=800"
    "assets/Images/About/beruwala.jpg" = "https://images.unsplash.com/photo-1589820296156-2454bb8a4d50?q=80&w=800"
    "assets/Images/About/colombo.jpg" = "https://media.istockphoto.com/id/1136453472/photo/galle-fort-lighthouse.jpg?s=612x612&w=0&k=20&c=gHwTy1b-1Zqg-vK_jC-R_uA_dM-j_y-o_f-l-v-k-y-s="

    "assets/Images/Gems/royal-blue.jpg" = "https://images.unsplash.com/photo-1618251213426-5b3211516e8b?q=80&w=800"
    "assets/Images/Gems/ruby.jpg" = "https://images.unsplash.com/photo-1615655406736-b37c4fabf923?q=80&w=800"
    "assets/Images/Gems/yellow.jpg" = "https://media.istockphoto.com/id/1148822080/photo/yellow-sapphire.jpg?s=612x612&w=0&k=20&c=N_8qWvKxO7C_bYqJ9e7fQ8g9Z5wX_r4t_x6y3z_p2u8="
    "assets/Images/Gems/pink-sapphire.jpg" = "https://images.unsplash.com/photo-1627932824900-58800ba7815d?q=80&w=800"
    "assets/Images/Gems/green-tourmaline.jpg" = "https://images.unsplash.com/photo-1601121141461-9d623259b158?q=80&w=800"

    "assets/Images/Export/header-bg.jpg" = "https://images.unsplash.com/photo-1566576912904-7a9117f7c4c5?q=80&w=2000"

    "assets/Images/Gallery/ring.jpg" = "https://images.unsplash.com/photo-1605100804763-247f67b3557e?q=80&w=800"
    "assets/Images/Gallery/hero-bg.mp4" = "https://videos.pexels.com/video-files/5453621/5453621-hd_1920_1080_25fps.mp4"
    "assets/Images/Gallery/closeup.jpg" = "https://images.unsplash.com/photo-1573408301185-9146fe634ad0?q=80&w=800"
    "assets/Images/Gallery/map.jpg" = "https://media.istockphoto.com/id/1146483163/vector/sri-lanka-map-vector-map-of-sri-lanka-in-blue-color-perfect-for-business-concepts.jpg?s=612x612&w=0&k=20&c=X7b7a7_o_k_o_k"
    "assets/Images/Gallery/green-tourmaline.jpg" = "https://images.unsplash.com/photo-1601121141461-9d623259b158?q=80&w=800"
}

foreach ($path in $images.Keys) {
    if (Test-Path $path) {
        $size = (Get-Item $path).Length
        if ($size -lt 5000) { 
            Remove-Item $path -Force
        }
    }
    
    if (-not (Test-Path $path)) {
        Write-Host "Downloading $path..."
        & curl.exe -L $images[$path] -o $path -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" --create-dirs --fail
    } else {
        Write-Host "Skipping $path (already exists)"
    }
}
