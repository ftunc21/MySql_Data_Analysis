# 📊 Layoffs Data Analysis with MySQL

<div align="right">
  <button onclick="switchLanguage('en')" id="en-btn" style="background-color: #0366d6; color: white; border: none; padding: 8px 16px; margin: 2px; border-radius: 6px; cursor: pointer; font-weight: bold;">EN</button>
  <button onclick="switchLanguage('tr')" id="tr-btn" style="background-color: #6c757d; color: white; border: none; padding: 8px 16px; margin: 2px; border-radius: 6px; cursor: pointer;">TR</button>
</div>

<div id="content-en">

## Overview
This project demonstrates a comprehensive data analysis workflow using MySQL, focusing on layoffs data from various companies worldwide. The analysis includes data cleaning, standardization, and exploratory data analysis to extract meaningful insights from the dataset.

## Dataset
- **Source**: `layoffs.csv` - Contains layoff data from companies globally
- **Size**: 2,361 records
- **Time Period**: 2020-2023
- **Columns**: company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions

## Project Structure

### 1. Data Cleaning (`layoff.sql`)
The data cleaning process follows industry best practices:

- **Duplicate Removal**: Used ROW_NUMBER() window function to identify and remove duplicate records
- **Data Standardization**: 
  - Trimmed whitespace from company names
  - Standardized industry names (e.g., 'Crypto Currency' → 'Crypto')
  - Fixed country names (removed trailing periods from 'United States.')
  - Converted date strings to proper DATE format
- **Null Value Handling**: 
  - Filled missing industry data using company-location matching
  - Removed records with no layoff information (both total and percentage null)

### 2. Exploratory Data Analysis (`data_analysis_mysql.sql`)
Comprehensive analysis covering:

- **Overall Statistics**: Maximum layoffs, percentage analysis
- **Company Analysis**: Total layoffs by company, companies with 100% layoffs
- **Industry Analysis**: Most affected industries
- **Geographic Analysis**: Layoffs by country and location
- **Temporal Analysis**: Trends over time, monthly patterns
- **Company Rankings**: Top 5 companies by year using window functions

## Key Findings

### Top Companies by Total Layoffs
1. **Amazon** - Highest total layoffs
2. **Google** - Significant workforce reduction
3. **Meta** - Major restructuring

### Most Affected Industries
1. **Consumer** industry leads in total layoffs
2. **Retail** and **Transportation** follow
3. **Technology** sector widely impacted

### Geographic Impact
- **United States** accounts for majority of layoffs
- Global impact across multiple countries
- Tech hubs most affected

### Timeline Analysis
- **2022-2023** peak layoff period
- Monthly trends showing seasonal patterns
- Post-IPO companies particularly affected

## Technical Skills Demonstrated

### SQL Techniques Used
- **Window Functions**: ROW_NUMBER(), DENSE_RANK(), PARTITION BY
- **Common Table Expressions (CTEs)**: Complex queries with temporary result sets
- **Data Type Conversion**: STR_TO_DATE(), ALTER TABLE MODIFY
- **String Functions**: TRIM(), SUBSTRING(), LIKE patterns
- **Aggregate Functions**: SUM(), MAX(), MIN(), AVG(), COUNT()
- **JOIN Operations**: Self-joins for data validation
- **Data Manipulation**: INSERT, UPDATE, DELETE operations

### Data Analysis Concepts
- Data quality assessment
- Duplicate detection and removal
- Data standardization techniques
- Exploratory data analysis methodology
- Statistical analysis and ranking

## Files Description
- `layoffs.csv` - Original dataset
- `layoff.sql` - Data cleaning and preprocessing script
- `data_analysis_mysql.sql` - Exploratory data analysis queries

## How to Use
1. Import `layoffs.csv` into MySQL database
2. Run `layoff.sql` for data cleaning
3. Execute `data_analysis_mysql.sql` for analysis
4. Review results and insights

---
*This project showcases end-to-end data analysis skills using MySQL, from raw data cleaning to meaningful business insights.*

</div>

<div id="content-tr" style="display: none;">

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

</div>

<script>
function switchLanguage(lang) {
    const enContent = document.getElementById('content-en');
    const trContent = document.getElementById('content-tr');
    const enBtn = document.getElementById('en-btn');
    const trBtn = document.getElementById('tr-btn');
    
    if (lang === 'en') {
        enContent.style.display = 'block';
        trContent.style.display = 'none';
        enBtn.style.backgroundColor = '#0366d6';
        enBtn.style.fontWeight = 'bold';
        trBtn.style.backgroundColor = '#6c757d';
        trBtn.style.fontWeight = 'normal';
    } else {
        enContent.style.display = 'none';
        trContent.style.display = 'block';
        trBtn.style.backgroundColor = '#0366d6';
        trBtn.style.fontWeight = 'bold';
        enBtn.style.backgroundColor = '#6c757d';
        enBtn.style.fontWeight = 'normal';
    }
}

// Default to English
document.addEventListener('DOMContentLoaded', function() {
    switchLanguage('en');
});
</script>
