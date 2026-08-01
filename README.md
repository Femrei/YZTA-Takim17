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

## Sprint Raporları

### Sprint 1

- **Backlog düzeni ve Story seçimleri**: İlk sprint olduğu için Trello panomuzu ekibin yazılım tecrübesine ve projenin başlangıç ihtiyaçlarına göre basitçe düzenledik. Bu 2 haftalık süreçte gözümüzü korkutmayacak, rahatça tamamlayabileceğimiz kadar iş seçmeye dikkat ettik. İş takibini kolaylaştırmak için ana hedeflerimizi (Story'leri) daha küçük yapılacak işlere (task'lere) böldük. Panomuzda mavi etiketli kartlar kullanıcı gözünden belirlediğimiz ana istekleri, kırmızı etiketli kartlar ise bunları yapmak için ekibin yapacağı teknik işleri gösteriyor.
- **Daily Scrum**: Takım olarak ilk tanışma ve proje planlama toplantımızı bir araya gelerek sesli/görüntülü olarak gerçekleştirdik. Sonrasındaki süreçte, üyelerin okulları ve kişisel yoğunlukları nedeniyle ortak bir saat bulmak zor olduğundan, Daily Scrum takibini WhatsApp üzerinden yazılı olarak yürütmeye karar verdik. Herkes gün içinde ne yaptığını, ne yapacağını ve bir engeli olup olmadığını gruptan paylaştı.
- **Sprint board update**: Sprint boyunca işlerimizi Trello panosu üzerinden takip ettik.
- **Ürün Durumu**: İlk sprinti tamamen projenin teorik altyapısını kurmaya, karbon ayak izi hesaplamalarında kullanacağımız veri setlerini araştırmaya ve uygulamanın mantıksal mimarisini tasarlamaya ayırdık. Bu nedenle bu sprintte henüz somut bir kod çıktısı veya çalışan bir uygulama arayüzü üretilmemiştir.
- **Sprint Review**: Alınan Kararlar: İlk sprint için yaptığımız değerlendirmede, projenin vizyonunu ve Trello panosundaki görev dağılımını planladığımız gibi tamamladığımızı gördük. Tracking Agent için gerekli olan karbon dönüşüm katsayılarını ve bilimsel verileri araştırdık. Ancak kullanıcı arayüzü tasarımı ve backend tarafındaki hesaplama algoritmasının kodlanması, ekibin tasarım ve geliştirme süreçlerine yeni adapte olmasından dolayı bu sprint yetişmedi. Süreci tıkamamak ve aceleye getirmemek adına bu iki teknik görevi bir sonraki sprint'e (Sprint 2) aktarma kararı aldık. Sprint Review Katılımcıları: Melis Can, Eda Kaygulu, Rüya Sena Demirci, Furkan Emre İnce, Musa Barutçu.
- **Sprint Retrospective**:
  - İlk sprintte planlama ve araştırma işlerine çok vakit ayırdığımızı fark ettik; sonraki sprintte kodlama ve tasarıma daha hızlı geçilmesi gerektiğine karar verdik.
  - Trello'daki kartları açarken işlerin büyüklüğünü tam kestiremediğimizi gördük. Gelecek sprint planlama toplantısında görev sürelerini daha gerçekçi dağıtacağız.
  - Ekipteki herkesin teknik tecrübesi aynı olmadığı için, önümüzdeki sprint boyunca takıldığımız yerlerde birbirimize daha çok destek olacağımız ortak çalışma saatleri belirleme kararı aldık.

### Sprint 2

- **Backlog Düzeni ve Story Seçimleri**: Sprint 2 başında Sprint 1'den kalan iki göreve (Tracking Agent backend ve UI/Frontend tasarımı) öncelik verdik. Ajan mimarisinin çalışır hale gelmesi diğer tüm özelliklere bağlı olduğu için backend ve Coach Agent prompt mühendisliği görevlerini sprint başına aldık. Kullanıcı perspektifinden uygulamada olması beklenen özellikleri içeren user story'ler (veri girişi, karbon hesaplama ve öneri sistemi) ilk sıraya yerleştirildi. Gamification ve karşılaştırma özellikleri ise temel akış tamamlandıktan sonra eklendi. Story puanları kartlar üzerinde belirtildi ve sprint'in toplam kapasitesi 14 puan olarak ayarlandı.
- **Daily Scrum**: Takım olarak Daily Scrum toplantılarını WhatsApp ve çoğunlukla Google Meet üzerinden yürüttük. Aldığımız kararları genellikle Google Meet üzerinden sesli olarak aldık ve fikirlerimizi tartıştık.
- **Sprint Board Update**: Sprint boyunca işlerimizi Trello panosu üzerinden (sprint ortası ve sprint sonu durumları ayrı ayrı) takip ettik.
- **Ürün Durumu**: Sprint 2'de uygulamanın üç ana sayfası tamamlandı ve çalışır hale getirildi.
  - **Kontrol Paneli**: Kullanıcının bugünkü CO₂ tüketimini, haftalık toplamını ve günlük ortalamasını gösterir. Günlük karbon bütçesi aşıldığında "Bugünlük karbon bütçenizi aştınız!" bildirimi gösterilir. Karbon denkliği için gereken yıllık ağaç sayısı ve bunu karşılamak için araçla "yapılmaması" gereken km hesabı yer alır. LLM'den gelen günlük yeşil öneriler ve yapılan son işlemler görüntülenir. Sağ üstte kullanıcı adı, günlük seri ve yeşil puan takibi gamification sistemiyle kullanıcı motivasyonunu artırır (tüm alt sayfalarda mevcut).
  - **Veri Girişi**: Kullanıcı ulaşım (araç tipi + km) ve elektrik tüketimi (kWh) sekmeler arasında geçiş yaparak girer. Araç tipi listesinde her araç için kg/km katsayısı açıkça gösterilir (örnek: Otomobil benzinli - 0.171 kg/km). Sağ taraftaki kayıt defterinde geçmiş girişler tarih, kategori etiketi (ULAŞIM/ENERJİ), miktar ve CO₂ değeriyle listelenir ve istendiğinde silinebilir. Kayıt defteri CSV ve JSON formatlarında indirilebilir.
  - **Yeşil Koç**: Coach Agent'ın LLM tabanlı prompt'larla ürettiği günlük görevler Ulaşım, Enerji ve Yeşil Yaşam kategorileri altında kullanıcıya sunulur. Her görevin tasarruf edeceği CO₂ miktarı ve kazanılacak puan değeri gösterilir. Tamamlanan görevler sağ panelde üzeri çizili olarak listelenir ve "Geri Al" ile iptal edilebilir. "Önerileri Yenile" butonu ile yeni görev seti oluşturulabilir.
- **Sprint Review**:
  - Alınan Kararlar: Sprint 2'nin temel hedefi olan çalışan uygulama arayüzü başarıyla tamamlandı. Üç sayfa (Kontrol Paneli, Veri Girişi, Yeşil Koç) işlevsel hale getirildi. Tracking Agent karbon hesaplama algoritması backend ile bağlandı, Coach Agent LLM prompt mühendisliği kurularak kişiselleştirilmiş görev önerileri üretilebilir hale geldi. Gamification sistemi sprint ortasında ekip kararıyla eklendi ve hızla hayata geçirildi.
  - Bir Sonraki Sprint'e Aktarılan Kararlar: Kullanıcı kimlik doğrulama (authentication) sistemi Sprint 3'te eklenecek, kullanıcılar uygulamaya bireysel giriş yapabilecek. Insight Agent haftalık trend analizi Sprint 3 kapsamında geliştirilecek.
  - Sprint Review Katılımcıları: Melis Can, Eda Kaygulu, Rüya Sena Demirci, Furkan Emre İnce, Musa Barutcu.
- **Sprint Retrospective**:
  - Gamification gibi planda olmayan bir özelliği sprint ortasında araya sıkıştırmanın kapasiteyi zorladığını fark ettik; bundan sonra sprint içi kapsam eklemelerini önce takım içinde puanlayıp öyle onaylamaya karar verdik.
  - Backend (hesaplama algoritması) ve frontend (arayüz) paralel ilerleyince entegrasyon noktasında küçük uyumsuzluklar yaşadık; bir sonraki sprintte API sözleşmesini (request/response şeması) daha erken netleştirmeye karar verdik.
  - LLM tabanlı Coach Agent'ın prompt'unu birkaç kez revize etmek zaman aldı; prompt denemelerini tek bir kişinin değil, çift olarak (pair) yürütmenin daha hızlı sonuç verdiğini gördük.
  - WhatsApp + Google Meet kombinasyonunun Daily Scrum için işlevsel olduğuna karar verdik, aynı düzeni sürdürmeye devam edeceğiz.
  - Trello kartlarını sprint sonunda topluca kapatmak yerine, işi bitirir bitirmez anlık güncellemenin ilerlemeyi daha görünür kıldığını fark ettik.
  - Test yazımını geliştirmenin sonuna bırakmak yerine, kritik hesaplama fonksiyonları (katsayı, bütçe, streak) için testleri kod ile birlikte yazmaya karar verdik.

### Sprint 3

- **Backlog Düzeni ve Story Seçimleri**: Sprint 3'ün önceliği, Sprint 2'den devreden iki karar kalemiydi: kullanıcı kimlik doğrulama ve Insight Agent'ın haftalık trend analizi. Bunların yanına Coach Agent'ın öneri sayısının artırılması, koç arayüzünün Kanban benzeri bir yapıya bölünmesi ve projenin Docker ile canlıya alınabilir hale getirilmesi eklendi. Görev dağılımı, backend/algoritma tarafı (Insight Agent, Coach Agent, Groq entegrasyonu, Docker) ve kimlik doğrulama + arayüz tarafı (Firebase Auth, routing, tasarım) olarak ikiye ayrıldı.
- **Daily Scrum**: Sprint boyunca WhatsApp ve Google Meet üzerinden ilerleme paylaşıldı; teslime yaklaşırken (1 Ağustos 2026) iki büyük parçanın (Insight/Coach tarafı ve Auth/arayüz tarafı) aynı gün art arda entegre edilebilmesi için ekstra bir senkronizasyon görüşmesi yapıldı.
- **Sprint Board Update**: Sprint boyunca işlerimizi Trello panosu üzerinden takip ettik.
- **Ürün Durumu**: Sprint 2'de tamamlanan üç sayfanın (Kontrol Paneli, Veri Girişi, Yeşil Koç) üzerine bu sprintte gerçek kullanıcı hesapları, yapay zeka destekli analiz derinliği ve daha güçlü bir koçluk deneyimi eklendi.

  - **Giriş / Kayıt**: Sprint 2'de uygulamaya hesap oluşturmadan, sadece bir isim yazarak giriliyordu; bu sprintte yerini, biri Firebase üzerinden diğeri Firebase'den tamamen bağımsız olan iki ayrı kimlik doğrulama yöntemi sunan gerçek bir giriş/kayıt akışına bıraktı.
    - Uygulamanın önüne herkese açık bir tanıtım (landing) sayfası eklendi; sayfadaki "Giriş Yap" ve "Ücretsiz Başla" butonları aynı giriş/kayıt penceresini açar.
    - **Google ile Giriş (Firebase Authentication)**: Firebase Web Auth entegre edildi. Kullanıcı "Google ile Giriş Yap" butonuna bastığında Google hesap seçim penceresi açılır; giriş başarılı olduğunda Firebase'den dönen kimlik bilgisi backend'e iletilip veritabanındaki kullanıcı kaydıyla eşleştirilir. Bu yöntemde ayrıca bir şifre girilmez.
    - **E-posta / Şifre ile Kayıt ve Giriş (Firebase'den bağımsız)**: Kayıt Ol sekmesinden ad-soyad, e-posta ve en az 6 karakterlik bir şifre girilerek doğrudan backend üzerinde hesap oluşturulur; şifre Firebase'e hiç gitmeden sunucu tarafında tuzlanıp (salt) hash'lenerek veritabanına kaydedilir. Giriş Yap sekmesinde de aynı e-posta ve şifre ile, yine Firebase'e uğramadan oturum açılır.

  - **Kontrol Paneli — Grafikler ve İçgörü Ajanı**: Sprint 2'de Kontrol Paneli yalnızca bugünkü/haftalık toplamı sade sayılarla gösteriyordu, herhangi bir trend analizi ya da yapay zeka yorumu yoktu; bu sprintte devreye giren İçgörü Ajanı ile bu değişti.
    - Kullanıcının verilerini haftalık, bir önceki hafta, aylık ve bugün olmak üzere dilimlere ayırıp analiz eder.
    - Haftalık değişim yüzdesini hesaplar; %5 üzeri artışta uyarı, %5 üzeri azalışta motive edici bir mesaj üretir.
    - Günlük ortalamayı, Türkiye'nin günlük kişi başı ortalamasıyla kıyaslar.
    - Haftalık toplamı; ağaç, araba-km ve kahve fincanı gibi somut eşdeğerlere çevirir.
    - Tüm bu analizi sade bir Türkçe özet cümlesi halinde "Yapay Zeka İçgörü Kartı"nda gösterir (örn. *"Bu hafta toplam 35.2 kg CO₂e ürettiniz. En büyük payı %65 ile ulaşım alıyor. Geçen haftaya göre tüketiminizi %12 azalttınız, harika gidiyorsunuz!"*).
    - Sprint 2'de olmayan, kesintisiz 14 günlük veriyi yumuşak kavisli, doğa yeşili (ulaşım) ve turuncu (elektrik) gradyan dolgulu bir çizgi grafiğiyle gösteren "14 Günlük Karbon Trendi" grafiği eklendi.
    - Ulaşım/elektrik oranını gösteren ayrı bir "Kategori Dağılımı (Doughnut)" grafiği eklendi.

  - **Yeşil Koç Yenilikleri**: Sprint 2'de 3 öneri sunan Yeşil Koç, bu sprintte geliştirildi.
    - Günlük öneri sayısı 3'ten 8'e çıkarıldı.
    - Arayüz ikiye bölünür: aktif öneriler 2×4'lük bir kart grid'inde gösterilir.
    - Tamamlanan görevler "Geri Al" bağlantısıyla birlikte ayrı bir listede toplanır.
    - "Önerileri Yenile" butonu ile yeni bir öneri seti oluşturulabilir.

  - **Groq LLM Entegrasyonu ve Docker**:
    - Koç Ajanı'na hız için Groq eklendi; sağlayıcı sırası Groq → Gemini → OpenAI → kural tabanlı yedek koç şeklinde güncellendi.
    - `Dockerfile` ve `run.sh` ile proje tek komutla container üzerinde ayağa kalkacak hale getirildi.
- **Sprint Review**:
  - Alınan Kararlar: Sprint 2'den devreden iki kalem (kimlik doğrulama ve Insight Agent trend analizi) tamamlandı. Buna ek olarak Coach Agent'ın öneri kapasitesi artırıldı, koç arayüzü yeniden tasarlandı, Groq entegrasyonu ile yanıt hızı iyileştirildi ve proje Docker ile canlıya alınabilir hale getirildi.
  - Bir Sonraki Sprint'e/Sonrasına Bırakılan Kararlar: Paylaşımlı yolculuk (carpooling) tasarruf hesabı bu sprint kapsamına alınamadı; gıda/alışveriş kategorileri ve sesli arayüz (Web Speech API) stretch goal olarak beklemede tutulmaya devam ediyor.
  - Sprint Review Katılımcıları: Melis Can, Eda Kaygulu, Rüya Sena Demirci, Furkan Emre İnce, Musa Barutcu.
- **Sprint Retrospective**:
  - İki büyük parçanın (Insight/Coach tarafı ve Auth/arayüz tarafı) sprint sonunda aynı güne denk gelmesi entegrasyon riskini artırdı; bir sonraki projede paralel çalışılan büyük parçaların en geç teslimden 1-2 gün önce birleştirilmesine karar verdik.
  - Coach Agent'a birden fazla LLM sağlayıcısı (Groq/Gemini/OpenAI) eklemenin, tek bir sağlayıcıya bağımlı kalmaktan çok daha güvenli olduğunu; ileride yeni ajanlar için de baştan çoklu sağlayıcı + kural tabanlı yedek deseniyle tasarım yapmaya karar verdik.
  - Docker altyapısını sprint ortasında değil erken kurmanın, son gün deploy stresini azalttığını gördük; bir sonraki projede containerization'ı ilk sprintlerde ele alacağız.

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
