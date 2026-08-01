# 🌿 CarbOn

**Çok Ajanlı Yapay Zeka Destekli Karbon Ayak İzi Koçu**

YZTA Bootcamp 2026 — Takım 17

---

## Takım İsmi

YZTA Takım 17 (CarbOn)

## Takım Elemanları

| Kişi | Rol | Teknik Sorumluluk |
|---|---|---|
| Melis Can | Product Owner + Developer | 
| Eda Kaygulu | Scrum Master + Developer |
| Rüya Sena Demirci | Developer |
| Furkan Emre İnce | Developer |
| Musa Barutcu | Developer |

## Ürün İsmi

CarbOn

## Ürün Açıklaması

CarbOn, bireylerin ulaşım ve elektrik tüketimi alışkanlıklarının çevresel
etkisini somut şekilde görmelerini ve azaltmalarını sağlayan çok ajanlı
yapay zeka destekli bir karbon ayak izi koçudur. Kullanıcı girdilerini
işleyen **Takip Ajanı**, eğilimleri analiz eden **İçgörü Ajanı** ve
kişiselleştirilmiş öneriler üreten **Koç Ajanı**, bir **Orkestratör**
tarafından koordine edilir; kullanıcı geçmişi hafızada tutularak zamanla
daha kişisel öneriler üretilir.

## Ürün Özellikleri

- 🚌 Ulaşım (11 araç tipi) ve ⚡ elektrik girişinden anlık CO₂e hesabı
- 📊 Haftalık karşılaştırma ve Türkiye ortalaması kıyası
- 🤖 Koç Ajanı'ndan günlük 8 "yeşil görev" (Groq/Gemini/OpenAI veya yerleşik koç)
- 📊 Yapay Zeka İçgörü Analizi ve 30 Günlük Kategori Kırılımlı Grafik (Chart.js)
- 🎯 Günlük karbon bütçesi halkası
- 🔥 Seri (streak) takibi ve görev tamamlama
- 🌳 Somutlaştırma: ağaç / araba-km / kahve eşdeğerleri
- 📤 CSV/JSON veri dışa aktarma
- 🐋 Docker ve Docker Compose ile kolay canlıya alma / deployment altyapısı
- 🛡️ LLM anahtarı olmadan da tam çalışan fallback mimarisi

## Hedef Kitle

- Karbon ayak izini azaltmak isteyen 18–60 yaş arası akıllı telefon kullanıcıları
- Sürdürülebilir yaşamı benimsemek isteyen dijital kullanıcılar
- Tüketim alışkanlıklarını bilinçli takip etmek isteyenler

---

## Kurulum ve Çalıştırma

### Yerel Çalıştırma

```bash
pip install -r requirements.txt
cp .env.example .env        # (opsiyonel) Firebase ve LLM anahtarlarını doldurun
uvicorn app.main:app --reload
```

Arayüz: http://localhost:8000 · API dokümanı: http://localhost:8000/docs

> **🔐 Kimlik Doğrulama (Authentication) Esnekliği:**
> - **Sıfır Konfigürasyon (Tak-Çalıştır):** Projeyi çeken kullanıcı `.env` dosyasına anahtar girmese bile sistem otomatik olarak **Yerel SQLite Auth** modunda çalışır. Kullanıcılar hesap oluşturup giriş yapabilir, sistem sıfır hatayla çalışır.
> - **Firebase Auth (Google ile 1-Tıkla Giriş):** Firebase kullanmak isteyenler `.env` dosyasına Firebase Web API anahtarlarını girdiğinde **Google ile Giriş Yap** ve Firebase Auth altyapısı otomatik devreye girer.

> **🤖 Yapay Zeka Koç Esnekliği:** `GROQ_API_KEY`, `GEMINI_API_KEY` veya `OPENAI_API_KEY` tanımlı değilse Koç Ajanı otomatik olarak yerleşik kural tabanlı koça geçer; uygulama anahtarsız da uçtan uca çalışır.

### Docker ile Canlıya Alma / Deploy

```bash
# Script ile hızlı çalıştırma:
bash run.sh

# Veya manuel olarak:
docker build -t carbon-app .
docker run -d -p 8000:8000 --name carbon-container --env-file .env carbon-app
```

### Testler

```bash
python -m pytest tests/ -v
```

---

## Mimari

```
Kullanıcı girdisi (km / kWh)
        │
        ▼
┌─────────────────── ORKESTRATÖR ───────────────────┐
│                                                   │
│  1) Tracking Agent                                │
│     km × araç katsayısı  |  kWh × 0.478           │
│     → SQLite hafızaya yazar                       │
│                                                   │
│  2) Insight Agent                                 │
│     haftalık kıyas, Türkiye ortalaması kıyası,    │
│     eşdeğerler                                    │
│                                                   │
│  3) Coach Agent                                   │
│     Groq → Gemini → OpenAI → kural tabanlı        │
│     → günün 8 yeşil görevi                        │
│                                                   │
│  Her adım kendi hata sınırında; ajan düşerse      │
│  akış kesilmez (fallback mekanizması).            │
└───────────────────────────────────────────────────┘
        │
        ▼
FastAPI REST → tek sayfa arayüz
```

### Veri Kaynakları

- **Elektrik:** 0.478 kg CO₂e/kWh — Türkiye ulusal şebeke (ETKB/EVÇED)
- **Ulaşım:** DEFRA 2024 yaklaşık katsayıları; `CLIMATIQ_API_KEY`
  tanımlanırsa Climatiq API'den canlı katsayı denenir, hata durumunda
  yerel tabloya düşülür.

### Proje Yapısı

```
carbon/
├── app/
│   ├── main.py              # FastAPI uçları
│   ├── config.py            # ortam değişkenleri
│   ├── db.py                # SQLite hafıza katmanı
│   ├── emission_factors.py  # katsayılar + kaynaklar
│   ├── agents/
│   │   ├── tracking.py      # Takip Ajanı
│   │   ├── insight.py       # İçgörü Ajanı
│   │   ├── coach.py         # Koç Ajanı (LLM + fallback)
│   │   └── orchestrator.py  # Orkestratör
│   └── static/index.html    # arayüz
├── tests/test_carbon.py     # 14 test
├── Dockerfile               # Canlıya alma (deployment) container tanımı
├── run.sh                   # Canlıya alma build/run otomasyon scripti
├── requirements.txt
└── .env.example
```

## API Özeti

| Uç | Açıklama |
|---|---|
| `POST /api/entries` | Girdi ekle → tam pipeline (Tracking→Insight→Coach) |
| `GET /api/dashboard` | Arayüz için tüm veriler tek çağrıda |
| `GET /api/insight` | İçgörü Ajanı analizi |
| `POST /api/coach/refresh` | Koç önerilerini yenile |
| `POST /api/tasks/complete` | Yeşil görevi tamamla (streak) |
| `POST /api/budget` | Günlük bütçeyi güncelle |
| `GET /api/export?fmt=csv\|json` | Veri dışa aktarma |
| `GET /api/health` | Sağlık + aktif LLM sağlayıcısı |

---

*CarbOn — YZTA Bootcamp 2026 | Takım 17*
