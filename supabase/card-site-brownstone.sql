-- ═══════════════════════════════════════════════════════════════
-- 명함용 현장 등록 — 브라운스톤 목동 (slug: brownstone-mokdong)
-- ───────────────────────────────────────────────────────────────
-- Supabase 대시보드 → SQL Editor 에 붙여넣고 Run.
--
-- ※ 아래 이미지 10개는 2026-10-25 운영 사이트에서 전부 200 확인 완료.
-- ※ Vercel 프로젝트 주소가 brownstone-mokdong.vercel.app 이 아니면
--    주소를 바꾼 뒤 실행한다.
--
-- 다시 실행해도 안전하다(같은 slug 면 덮어쓴다).
-- ═══════════════════════════════════════════════════════════════

insert into public.card_sites
  (slug, name, headline, subhead, hero_url, specs, images, notice, address, site_url, published)
values (
  'brownstone-mokdong',
  '브라운스톤 목동',
  '목동에서 내 집 마련, 아직 늦지 않았습니다',
  '9호선 염창역 역세권 · 2027년 1월 입주 예정 · 선착순 계약',
  'https://brownstone-mokdong.vercel.app/images/bs/hero.jpg',
  '[
    {
        "k": "공급위치",
        "v": "서울특별시 양천구 목동 557번지 일원"
    },
    {
        "k": "사업방식",
        "v": "LH참여형 가로주택정비사업"
    },
    {
        "k": "건축규모",
        "v": "지하 2층 ~ 지상 5~10층, 2개 동"
    },
    {
        "k": "세대수",
        "v": "총 85세대 (일반분양 29세대)"
    },
    {
        "k": "주택형",
        "v": "전용 38 · 39 · 44 · 49 · 59 · 70 · 81 · 84B㎡"
    },
    {
        "k": "분양가",
        "v": "5억 6,040만 ~ 13억 2,050만 원 (호실별 차등 · 계약금 10%)"
    },
    {
        "k": "교통",
        "v": "9호선 염창역 · 여의도 약 8분, 신논현 약 23분 (급행 기준)"
    },
    {
        "k": "입주예정",
        "v": "2027년 1월 예정"
    },
    {
        "k": "시공",
        "v": "이수건설(주)"
    },
    {
        "k": "시행",
        "v": "서울목동엘에이치참여형가로주택정비사업조합"
    },
    {
        "k": "홍보관",
        "v": "서울특별시 강서구 공항대로 219, 210호"
    },
    {
        "k": "분양문의",
        "v": "1555-1087"
    }
]'::jsonb,
  '[
    "https://brownstone-mokdong.vercel.app/images/bs/hero.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/site-plan.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/map-area.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/price-table.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/plan-59.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/plan-81.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/plan-84B.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/prem-traffic.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/way-1.jpg",
    "https://brownstone-mokdong.vercel.app/images/bs/contract.jpg"
]'::jsonb,
  '청약통장·전매제한·실거주의무 없이 선착순 계약이 가능합니다. 다만 상기 내용은 투기과열지구에 적용되는 사항으로, 향후 관련 법령 및 규제지역 변경 등에 따라 달라질 수 있습니다. 잔여 세대와 타입은 수시로 변동되오니 방문 전 연락 부탁드립니다. 사진은 이미지컷으로 실제와 다를 수 있으며, 세부사항은 입주자모집공고를 따릅니다.',
  '서울특별시 강서구 공항대로 219, 210호',
  'https://brownstone-mokdong.vercel.app/',
  true
)
on conflict (slug) do update set
  name      = excluded.name,
  headline  = excluded.headline,
  subhead   = excluded.subhead,
  hero_url  = excluded.hero_url,
  specs     = excluded.specs,
  images    = excluded.images,
  notice    = excluded.notice,
  address   = excluded.address,
  site_url  = excluded.site_url,
  published = excluded.published;

-- 확인
select slug, name, published,
       jsonb_array_length(specs)  as 사업개요,
       jsonb_array_length(images) as 홍보이미지
from public.card_sites order by slug;
