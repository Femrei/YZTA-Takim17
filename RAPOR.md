# CarbOn — Detaylı Proje Raporu

YZTA Bootcamp 2026 · Takım 17 · Hazırlanma tarihi: 1 Ağustos 2026 (Sprint 3 Teslimatı)

---

## 1. Özet

Proje özet dökümanında tanımlanan CarbOn mimarisi (Tracking + Insight + Coach ajanları ve Orkestratör) uçtan uca, çalışır ve production'a hazır bir uygulama olarak kodlandı. Uygulama tek komutla veya Docker ile ayağa kalkıyor, LLM anahtarı olmadan bile tam fonksiyonel çalışıyor ve 14 otomatik testin tamamını geçiyor. Sprint 2 ve Sprint 3 hedeflerinin (US-1'den US-10'a kadar, tüm stretch goal'ler dahil) tamamı bu teslimatta karşılanıyor.

## 2. Teslim Edilen Bileşenler

| Bileşen | Dosya | Durum |
|---|---|---|
| Tracking Agent | `app/agents/tracking.py` | ✅ km/kWh doğrulama, katsayı hesabı, Climatiq opsiyonu |
| Insight Agent | `app/agents/insight.py` | ✅ trend, kırılım, haftalık kıyas, özet metin, eşdeğerler |
| Coach Agent | `app/agents/coach.py` | ✅ Groq → Gemini → OpenAI → kural tabanlı fallback |
| Orkestratör | `app/agents/orchestrator.py` | ✅ hata sınırlı pipeline, adım bazlı durum raporu |
| Hafıza katmanı | `app/db.py` | ✅ SQLite: girişler, görevler, kullanıcı ayarları, streak |
| REST API | `app/main.py` | ✅ 10 uç + otomatik Swagger dokümanı (/docs) |
| Arayüz | `app/static/index.html` | ✅ Tek sayfa responsive tasarım, AI İçgörü kartı, Chart.js trend grafiği, bölünmüş koç grid yapısı |
| Testler | `tests/test_carbon.py` | ✅ 14/14 geçiyor |
| Deploy | `Dockerfile`, `run.sh`, `.env.example` | ✅ Docker containerization ve hızlı çalıştırma scriptleri hazır |
| Dokümantasyon | `README.md` | ✅ bootcamp README şablonuna uygun |

## 3. Mimari Kararlar ve Gerekçeleri

**Ajan sınırları hata sınırlarıyla örtüşüyor.** Orkestratör her ajanı ayrı try/except bloğunda çalıştırır. Insight çökerse Coach yine çalışır; Coach'un LLM çağrısı başarısız olursa kural tabanlı koç devreye girer. Kılavuzdaki "fallback mekanizması" gereksinimi böylece jüri karşısında canlı demo sırasında bile güvence altında: internet kesilse, API kotası dolsa uygulama öneri üretmeye devam eder.

**LLM sağlayıcısı takılabilir (pluggable).** Coach Agent; Groq, Gemini ve OpenAI model sağlayıcılarını destekler. Doğrudan REST çağrısı (httpx) kullanır; modeller aynı prompt ve aynı JSON çıktı sözleşmesiyle çalışır. Model çıktısı `{"tips": [...]}` şemasına zorlanır ve `_extract_tips` fonksiyonu markdown kod bloklarını temizleyerek güvenli parse yapar.

**Hafıza SQLite üzerinde.** Kullanıcı bazlı girişler, günün görevleri ve bütçe ayarı kalıcıdır; Insight Agent her analizde son 30 günü okur, Coach Agent önerilerini "günün görevleri" olarak hafızaya yazar. Ek sunucu gerektirmez, Docker imajıyla birlikte taşınır.

**Katsayılar tek modülde ve kaynaklı.** `emission_factors.py` içinde her katsayının kaynağı (ETKB/EVÇED 0.478 kg/kWh, DEFRA 2024 ulaşım değerleri) belgelendi. Climatiq API anahtarı verilirse ulaşım katsayısı canlı çekilir, hata durumunda yerel tabloya düşülür.

## 4. Eklenen Yeni Özellikler (sprintler boyunca geliştirilenler)

Aşağıdakiler orijinal dokümanda bulunmayan veya süreç içinde eklenen geliştirmelerdir:

1. **Günlük Karbon Bütçesi Halkası (arayüzün imza öğesi).** Türkiye kişi başı ortalamasından türetilen 15 kg/gün varsayılan bütçe; dış halka bugünkü toplamı, iç halka haftalık ortalamayı gösterir. Bütçe aşılırsa halka kırmızıya döner.
2. **Yapay Zeka İçgörü Kartı (AI Weekly Insight).** İçgörü Ajanı'nın verileri analiz ederek çıkardığı haftalık değişim, günlük ortalama, 30 günlük toplam istatistiklerini ve YZ özet metnini içeren özel kart.
3. **30 Günlük Kategori Kırılımlı Grafik (Chart.js).** Kullanıcıların son 30 günde hangi kategoride ne kadar karbon ayak izi ürettiklerini gün bazında gösteren etkileşimli, responsive yığılmış bar grafiği.
4. **Bölünmüş Koç Arayüzü.** Aktif önerilerin (2x4 grid) ve tamamlananların (Geri Al destekli yan panel) Kanban-benzeri şık yönetimi.
5. **Oyunlaştırma: yeşil görevler + streak.** Koçun 8 önerisi işaretlenebilir görevlere dönüşür; art arda veri girilen/görev tamamlanan günler 🔥 seri sayacını büyütür. Puanlar tamamlanan görev başına 15 puan, veri girişi başına 10 puan kazandırır (seri koruma puana etki etmez).
6. **Somutlaştırma eşdeğerleri.** Haftalık toplam; "X ağacın yıllık emdiği CO₂", "Y km araba", "Z fincan kahve" olarak gösterilir.
7. **Türkiye ortalaması kıyası.** Kullanıcının günlük ortalaması ulusal ortalamanın yüzdesi olarak gösterilir.
8. **Kural tabanlı yedek koç.** LLM anahtarı hiç olmasa bile kullanıcının verisine göre anlamlı 8 öneri üreten deterministik koç.
9. **Veri dışa aktarma (CSV/JSON).** Kullanıcı verisinin taşınabilirliği.
10. **Climatiq canlı katsayı opsiyonu.** Canlı API katsayıları ve yerel DEFRA tablosu fallback'li tek akışta birleştirildi.
11. **Kayıt silme + tarih seçerek geçmişe giriş.** Fatura dönemi gibi geçmiş tarihli veriler girilebilir.
12. **14 testlik otomatik test paketi.** "Temiz kod/mimari" kalemlerini hedefler.
13. **Groq LLM Desteği.** Hızlı model çıkarımı için Groq API entegrasyonu.
14. **Dockerfile ve Hızlı Çalıştırma Altyapısı.** Projenin buluta/canlıya deploy edilebilir Docker yapısı.

## 5. Değerlendirme Kriterleriyle Eşleşme

| Kriter | Karşılık |
|---|---|
| Yarışmaya hazır, çalışan proje (10) | Tek komutla veya Docker ile çalışıyor; anahtar gerektirmeyen demo modu |
| Özgünlük (10) | Bütçe halkası, streak, eşdeğerler, TR-özel katsayılar, bölünmüş koç paneli |
| Ürün tamamlanma (10) | Sprint 3 kapsamının tamamı + tüm stretch goal'ler |
| Pazara uygunluk (10) | Hedef kitleye uygun sade Türkçe arayüz, mobil uyumlu, modern grafikler |
| YZ modeli seçimi/kullanımı (20) | Groq/Gemini/OpenAI prompt mühendisliği, JSON şema zorlaması |
| Agent kullanımı, hafıza, orkestrasyon (15) | 3 ajan + orkestratör, SQLite hafıza, hata sınırları |
| Mimari/temiz kod (15) | Katmanlı yapı, tip ipuçları, docstring'ler, 14 test |
| Canlıya alınabilirlik (10) | Dockerfile, run.sh ve .env yapılandırması |

## 6. Test Sonuçları

`python -m pytest tests/ -v` → **14 geçti, 0 hata.** Kapsam: ulaşım/elektrik hesap doğruluğu, geçersiz girdi reddi, haftalık değişim tespiti, kural tabanlı koçun her koşulda 8 öneri üretmesi, LLM çıktısı JSON ayıklama, tam pipeline akışı, API doğrulama hataları (422), CSV dışa aktarma, görev tamamlama/streak, bütçe güncelleme, görev sıfırlama.

## 7. Gelecek Planları ve Sınırlar

- **Kimlik doğrulama yok:** kullanıcı ayrımı isimle yapılıyor. Canlı üründe basit bir oturum/token katmanı eklenmelidir.
- **Gıda/alışveriş kategorileri** MVP dışı bırakıldı; `emission_factors.py` yapısı yeni kategori eklemeye hazır.
- **Ses arayüzü** stretch goal olarak duruyor; Web Speech API ile frontend'e eklenebilir.

## 8. Çalıştırma Talimatı (özet)

### Yerel Çalıştırma:
```bash
pip install -r requirements.txt
uvicorn app.main:app --reload
```

### Docker ile Çalıştırma:
```bash
bash run.sh
```

LLM'li mod için `.env` dosyasına `GROQ_API_KEY`, `GEMINI_API_KEY` veya `OPENAI_API_KEY` girin; girmezseniz yerleşik koç otomatik devrededir.

---

*Rapor sonu — CarbOn, YZTA Bootcamp 2026, Takım 17*
