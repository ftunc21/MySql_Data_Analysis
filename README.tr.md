# 📊 MySQL ile İşten Çıkarma Verileri Analizi

<div align="right">
  <strong>🌐 Dil:</strong> 
  <a href="README.md">🇺🇸 English</a> | 
  <a href="README.tr.md">🇹🇷 Türkçe</a>
</div>

## Genel Bakış
Bu proje, MySQL kullanarak kapsamlı bir veri analizi iş akışını göstermektedir. Dünya çapındaki çeşitli şirketlerden işten çıkarma verilerine odaklanarak, veri setinden anlamlı içgörüler çıkarmak için veri temizleme, standardizasyon ve keşifçi veri analizi içermektedir.

## Veri Seti
- **Kaynak**: `layoffs.csv` - Küresel şirketlerden işten çıkarma verileri
- **Boyut**: 2.361 kayıt
- **Zaman Aralığı**: 2020-2023
- **Sütunlar**: şirket, konum, sektör, toplam_işten_çıkarılan, yüzde_işten_çıkarılan, tarih, aşama, ülke, toplanan_fon_milyon

## Proje Yapısı

### 1. Veri Temizleme (`layoff.sql`)
Veri temizleme süreci endüstri en iyi uygulamalarını takip eder:

- **Tekrar Eden Kayıtların Kaldırılması**: ROW_NUMBER() pencere fonksiyonu kullanarak tekrar eden kayıtları tespit etme ve kaldırma
- **Veri Standardizasyonu**: 
  - Şirket isimlerinden boşlukları temizleme
  - Sektör isimlerini standardize etme (örn. 'Crypto Currency' → 'Crypto')
  - Ülke isimlerini düzeltme ('United States.' sonundaki noktayı kaldırma)
  - Tarih stringlerini uygun DATE formatına çevirme
- **Null Değer İşleme**: 
  - Eksik sektör verilerini şirket-konum eşleştirmesi kullanarak doldurma
  - İşten çıkarma bilgisi olmayan kayıtları kaldırma (hem toplam hem yüzde null)

### 2. Keşifçi Veri Analizi (`data_analysis_mysql.sql`)
Şunları kapsayan kapsamlı analiz:

- **Genel İstatistikler**: Maksimum işten çıkarmalar, yüzde analizi
- **Şirket Analizi**: Şirkete göre toplam işten çıkarmalar, %100 işten çıkarma yapan şirketler
- **Sektör Analizi**: En çok etkilenen sektörler
- **Coğrafi Analiz**: Ülke ve konuma göre işten çıkarmalar
- **Zamansal Analiz**: Zaman içindeki trendler, aylık desenler
- **Şirket Sıralamaları**: Pencere fonksiyonları kullanarak yıllara göre ilk 5 şirket

## Temel Bulgular

### Toplam İşten Çıkarmaya Göre En Büyük Şirketler
1. **Amazon** - En yüksek toplam işten çıkarma
2. **Google** - Önemli işgücü azaltması
3. **Meta** - Büyük yeniden yapılanma

### En Çok Etkilenen Sektörler
1. **Tüketici** sektörü toplam işten çıkarmalarda önde
2. **Perakende** ve **Ulaştırma** takip ediyor
3. **Teknoloji** sektörü yaygın şekilde etkilendi

### Coğrafi Etki
- **Amerika Birleşik Devletleri** işten çıkarmaların çoğunluğunu oluşturuyor
- Birden fazla ülkede küresel etki
- Teknoloji merkezleri en çok etkilenen

### Zaman Çizelgesi Analizi
- **2022-2023** doruk işten çıkarma dönemi
- Mevsimsel desenleri gösteren aylık trendler
- Halka açık sonrası şirketler özellikle etkilendi

## Gösterilen Teknik Beceriler

### Kullanılan SQL Teknikleri
- **Pencere Fonksiyonları**: ROW_NUMBER(), DENSE_RANK(), PARTITION BY
- **Ortak Tablo İfadeleri (CTE)**: Geçici sonuç kümeleri ile karmaşık sorgular
- **Veri Tipi Dönüşümü**: STR_TO_DATE(), ALTER TABLE MODIFY
- **String Fonksiyonları**: TRIM(), SUBSTRING(), LIKE desenleri
- **Toplama Fonksiyonları**: SUM(), MAX(), MIN(), AVG(), COUNT()
- **JOIN İşlemleri**: Veri doğrulama için self-join'ler
- **Veri Manipülasyonu**: INSERT, UPDATE, DELETE işlemleri

### Veri Analizi Kavramları
- Veri kalitesi değerlendirmesi
- Tekrar eden kayıt tespiti ve kaldırılması
- Veri standardizasyon teknikleri
- Keşifçi veri analizi metodolojisi
- İstatistiksel analiz ve sıralama

## Dosya Açıklamaları
- `layoffs.csv` - Orijinal veri seti
- `layoff.sql` - Veri temizleme ve ön işleme scripti
- `data_analysis_mysql.sql` - Keşifçi veri analizi sorguları

## Nasıl Kullanılır
1. `layoffs.csv` dosyasını MySQL veritabanına aktarın
2. Veri temizleme için `layoff.sql` dosyasını çalıştırın
3. Analiz için `data_analysis_mysql.sql` dosyasını çalıştırın
4. Sonuçları ve içgörüleri inceleyin

---
*Bu proje, ham veri temizlemeden anlamlı iş içgörülerine kadar MySQL kullanarak uçtan uca veri analizi becerilerini sergiler.*
