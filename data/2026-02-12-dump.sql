--
-- PostgreSQL database dump
--

\restrict fkunuJytaHs9rvlJHz2I4jXbLqIYfE6EQaquz3DnPLgPh771coPxC1WfhFMxgpe

-- Dumped from database version 15.15
-- Dumped by pg_dump version 15.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP INDEX IF EXISTS public.ix_objects_and_other_popular_name_en;
DROP INDEX IF EXISTS public.ix_objects_and_other_id;
DROP INDEX IF EXISTS public.ix_garden_styles_popular_name_en;
DROP INDEX IF EXISTS public.ix_garden_styles_id;
DROP INDEX IF EXISTS public.ix_flora_pteridophyte_scientific_name;
DROP INDEX IF EXISTS public.ix_flora_pteridophyte_popular_name_en;
DROP INDEX IF EXISTS public.ix_flora_pteridophyte_id;
DROP INDEX IF EXISTS public.ix_flora_gimnosperma_scientific_name;
DROP INDEX IF EXISTS public.ix_flora_gimnosperma_popular_name_en;
DROP INDEX IF EXISTS public.ix_flora_gimnosperma_id;
DROP INDEX IF EXISTS public.ix_flora_bryophyte_scientific_name;
DROP INDEX IF EXISTS public.ix_flora_bryophyte_popular_name_en;
DROP INDEX IF EXISTS public.ix_flora_bryophyte_id;
DROP INDEX IF EXISTS public.ix_flora_angiosperm_scientific_name;
DROP INDEX IF EXISTS public.ix_flora_angiosperm_popular_name_en;
DROP INDEX IF EXISTS public.ix_flora_angiosperm_id;
DROP INDEX IF EXISTS public.ix_fauna_scientific_name;
DROP INDEX IF EXISTS public.ix_fauna_popular_name_en;
DROP INDEX IF EXISTS public.ix_fauna_id;
ALTER TABLE IF EXISTS ONLY public.objects_and_other DROP CONSTRAINT IF EXISTS objects_and_other_pkey;
ALTER TABLE IF EXISTS ONLY public.garden_styles DROP CONSTRAINT IF EXISTS garden_styles_pkey;
ALTER TABLE IF EXISTS ONLY public.flora_pteridophyte DROP CONSTRAINT IF EXISTS flora_pteridophyte_pkey;
ALTER TABLE IF EXISTS ONLY public.flora_gimnosperma DROP CONSTRAINT IF EXISTS flora_gimnosperma_pkey;
ALTER TABLE IF EXISTS ONLY public.flora_bryophyte DROP CONSTRAINT IF EXISTS flora_bryophyte_pkey;
ALTER TABLE IF EXISTS ONLY public.flora_angiosperm DROP CONSTRAINT IF EXISTS flora_angiosperm_pkey;
ALTER TABLE IF EXISTS ONLY public.fauna DROP CONSTRAINT IF EXISTS fauna_pkey;
ALTER TABLE IF EXISTS public.objects_and_other ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.garden_styles ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.flora_pteridophyte ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.flora_gimnosperma ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.flora_bryophyte ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.flora_angiosperm ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.fauna ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.objects_and_other_id_seq;
DROP TABLE IF EXISTS public.objects_and_other;
DROP SEQUENCE IF EXISTS public.garden_styles_id_seq;
DROP TABLE IF EXISTS public.garden_styles;
DROP SEQUENCE IF EXISTS public.flora_pteridophyte_id_seq;
DROP TABLE IF EXISTS public.flora_pteridophyte;
DROP SEQUENCE IF EXISTS public.flora_gimnosperma_id_seq;
DROP TABLE IF EXISTS public.flora_gimnosperma;
DROP SEQUENCE IF EXISTS public.flora_bryophyte_id_seq;
DROP TABLE IF EXISTS public.flora_bryophyte;
DROP SEQUENCE IF EXISTS public.flora_angiosperm_id_seq;
DROP TABLE IF EXISTS public.flora_angiosperm;
DROP SEQUENCE IF EXISTS public.fauna_id_seq;
DROP TABLE IF EXISTS public.fauna;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: fauna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fauna (
    id integer NOT NULL,
    popular_name_en character varying(255),
    popular_name_jp character varying(255),
    scientific_name character varying(255),
    animal_class character varying(255),
    images jsonb,
    diet_type character varying(255),
    diet_natural text,
    diet_urban text,
    active_period text,
    origin_status text,
    cultural_info text,
    habitat text,
    links text,
    book_sources text,
    book_references text,
    comments text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.fauna OWNER TO postgres;

--
-- Name: fauna_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fauna_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fauna_id_seq OWNER TO postgres;

--
-- Name: fauna_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fauna_id_seq OWNED BY public.fauna.id;


--
-- Name: flora_angiosperm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flora_angiosperm (
    id integer NOT NULL,
    popular_name_en character varying(255),
    popular_name_jp character varying(255),
    scientific_name character varying(255),
    classification character varying(255),
    description text,
    images jsonb,
    lifecycle character varying(100),
    cultivated_when character varying(255),
    months_foliage character varying(255),
    months_flowers character varying(255),
    months_fruits character varying(255),
    edible_fruit character varying(100),
    fruit_eaten character varying(100),
    other_eaten character varying(255),
    what_eaten text,
    when_harvested text,
    origin character varying(255),
    garden_type character varying(255),
    cultural_info text,
    habitat text,
    links text,
    book_references text,
    comments text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.flora_angiosperm OWNER TO postgres;

--
-- Name: flora_angiosperm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flora_angiosperm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flora_angiosperm_id_seq OWNER TO postgres;

--
-- Name: flora_angiosperm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flora_angiosperm_id_seq OWNED BY public.flora_angiosperm.id;


--
-- Name: flora_bryophyte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flora_bryophyte (
    id integer NOT NULL,
    popular_name_en character varying(255),
    popular_name_jp character varying(255),
    scientific_name character varying(255),
    classification character varying(255),
    description text,
    images jsonb,
    origin character varying(255),
    garden_type character varying(255),
    cultural_info text,
    habitat text,
    links text,
    book_references text,
    comments text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.flora_bryophyte OWNER TO postgres;

--
-- Name: flora_bryophyte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flora_bryophyte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flora_bryophyte_id_seq OWNER TO postgres;

--
-- Name: flora_bryophyte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flora_bryophyte_id_seq OWNED BY public.flora_bryophyte.id;


--
-- Name: flora_gimnosperma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flora_gimnosperma (
    id integer NOT NULL,
    popular_name_en character varying(255),
    popular_name_jp character varying(255),
    scientific_name character varying(255),
    classification character varying(255),
    description text,
    images jsonb,
    lifecycle character varying(100),
    months_foliage character varying(255),
    months_flowers character varying(255),
    months_fruits character varying(255),
    origin character varying(255),
    garden_type character varying(255),
    cultural_info text,
    habitat text,
    links text,
    book_references text,
    comments text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.flora_gimnosperma OWNER TO postgres;

--
-- Name: flora_gimnosperma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flora_gimnosperma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flora_gimnosperma_id_seq OWNER TO postgres;

--
-- Name: flora_gimnosperma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flora_gimnosperma_id_seq OWNED BY public.flora_gimnosperma.id;


--
-- Name: flora_pteridophyte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flora_pteridophyte (
    id integer NOT NULL,
    popular_name_en character varying(255),
    popular_name_jp character varying(255),
    scientific_name character varying(255),
    classification character varying(255),
    description text,
    images jsonb,
    lifecycle character varying(100),
    months_foliage character varying(255),
    origin character varying(255),
    garden_type character varying(255),
    cultural_info text,
    habitat text,
    links text,
    book_references text,
    comments text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.flora_pteridophyte OWNER TO postgres;

--
-- Name: flora_pteridophyte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.flora_pteridophyte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.flora_pteridophyte_id_seq OWNER TO postgres;

--
-- Name: flora_pteridophyte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.flora_pteridophyte_id_seq OWNED BY public.flora_pteridophyte.id;


--
-- Name: garden_styles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.garden_styles (
    id integer NOT NULL,
    popular_name_en character varying(255),
    name_jp character varying(255),
    characteristics text,
    links text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.garden_styles OWNER TO postgres;

--
-- Name: garden_styles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.garden_styles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.garden_styles_id_seq OWNER TO postgres;

--
-- Name: garden_styles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.garden_styles_id_seq OWNED BY public.garden_styles.id;


--
-- Name: objects_and_other; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.objects_and_other (
    id integer NOT NULL,
    popular_name_en character varying(255),
    name_jp character varying(255),
    images jsonb,
    purpose_original text,
    purpose_other text,
    links text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone
);


ALTER TABLE public.objects_and_other OWNER TO postgres;

--
-- Name: objects_and_other_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.objects_and_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.objects_and_other_id_seq OWNER TO postgres;

--
-- Name: objects_and_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.objects_and_other_id_seq OWNED BY public.objects_and_other.id;


--
-- Name: fauna id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fauna ALTER COLUMN id SET DEFAULT nextval('public.fauna_id_seq'::regclass);


--
-- Name: flora_angiosperm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_angiosperm ALTER COLUMN id SET DEFAULT nextval('public.flora_angiosperm_id_seq'::regclass);


--
-- Name: flora_bryophyte id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_bryophyte ALTER COLUMN id SET DEFAULT nextval('public.flora_bryophyte_id_seq'::regclass);


--
-- Name: flora_gimnosperma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_gimnosperma ALTER COLUMN id SET DEFAULT nextval('public.flora_gimnosperma_id_seq'::regclass);


--
-- Name: flora_pteridophyte id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_pteridophyte ALTER COLUMN id SET DEFAULT nextval('public.flora_pteridophyte_id_seq'::regclass);


--
-- Name: garden_styles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garden_styles ALTER COLUMN id SET DEFAULT nextval('public.garden_styles_id_seq'::regclass);


--
-- Name: objects_and_other id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objects_and_other ALTER COLUMN id SET DEFAULT nextval('public.objects_and_other_id_seq'::regclass);


--
-- Data for Name: fauna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fauna (id, popular_name_en, popular_name_jp, scientific_name, animal_class, images, diet_type, diet_natural, diet_urban, active_period, origin_status, cultural_info, habitat, links, book_sources, book_references, comments, created_at, updated_at) FROM stdin;
1	Tanuki	たぬき	Nyctereutes procyonoides viverrinus	Mammalia	[{"path": "Animal/Tanuki - Animal Picture.webp", "type": "animal", "original_name": "Tanuki"}, {"path": "Animal/Tanuki - Natural Habitat Picture.webp", "type": "habitat", "original_name": "Tanuki"}, {"path": "Animal/Tanuki_Jardim.webp", "type": "garden", "original_name": "Tanuki"}]	Omnivorous	Omnivorous: Tanuki have a highly varied diet, consuming fruits, berries, nuts, insects, small vertebrates (e.g., frogs, rodents), and occasionally carrion.\nSeasonal Shifts: In warmer months, they may eat more insects and small animals; in autumn, they consume more nuts and fruits to build fat reserves.\nTheir adaptability as omnivores allows tanuki to thrive in diverse environments, from forests to the outskirts of human settlements.	Human Food Waste: In suburban or urban areas, tanuki often scavenge in garbage bins or compost piles for leftover food.\nGardens and Yards: They may also eat fallen fruit or vegetables, dig for grubs, or prey on small animals like rats or mice if available.\nPet Food: On occasion, tanuki may attempt to eat cat or dog food left outdoors.\nTheir opportunistic feeding habits can lead them into closer contact with people, particularly at night.	Primarily Nocturnal: Tanuki are most active after sunset, which is when they venture into gardens or around homes to forage.\nYear-Round Presence: They do not hibernate, but they may reduce activity during the coldest months to conserve energy.\nBreeding Season: Mating occurs in late winter (around February–March), and pups are born in spring. During pup-rearing (spring to early summer), adults might be more boldly active near human habitats if they perceive reliable food sources.\nIn domestic gardens on the fringes of urban areas, tanuki sightings may increase in late evening or early night, especially where food sources—like fruit-bearing trees—are abundant.	Native to Japan (and East Asia)	Folklore & Mythology: Shape-Shifting Tricksters: In Japanese folklore, tanuki are known as mischievous and jovial shapeshifters. They’re often depicted in legends transforming their appearance or using their belly (and testicles in some stories/art) in comical ways. Statues and Symbols: You’ll frequently see tanuki statues outside restaurants and shops, symbolizing prosperity, business success, and good fortune. These statues usually feature: A big belly (sign of boldness). A sake bottle (sign of virtue). A promissory note (reminder of caution in finances). A straw hat (protection from bad weather or trouble).\nModern Perception: Coexistence and Conservation: Many people have a fondness for tanuki, thanks to their folklore status, but they can be considered pests if they rummage through trash or damage gardens. Pop Culture: Tanuki frequently appear in anime, manga, and modern art as whimsical or comedic figures—e.g., Studio Ghibli’s film Pom Poko, which centers on tanuki defending their forest habitat. Overall, the tanuki holds a unique place in Japanese culture, balancing its role as a real, adaptable canid and a legendary, fun-loving trickster of folklore.	\N	Muito bom: https://www.ntv.co.jp/megaten/oa/20180114.html\n\nEcology and how to deal: https://www.pref.nagasaki.jp/shared/uploads/2014/01/1389920991.pdf	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
2	Praying Mantis	カマキリ	Mantodea	Insecta	[{"path": "Animal/Praying Mantis - Animal Picture.webp", "type": "animal", "original_name": "Praying Mantis"}, {"path": "Animal/Praying Mantis - Garden Picture.webp", "type": "garden", "original_name": "Praying Mantis"}, {"path": "Animal/Praying Mantis - Natural Habitat Picture.webp", "type": "habitat", "original_name": "Praying Mantis"}]	Carnivorous	Insects: Flies, beetles, crickets, moths, grasshoppers, aphids, leafhoppers, mosquitoes, mites, wasps, and cockroaches \nOther animals: Lizards, frogs, mice, and small birds.\n\nAmbush Hunters: They are known for their sit-and-wait strategy, camouflaging themselves on leaves or stems and striking out with their powerful front legs when prey comes close.	Similar Prey Availability: In domestic gardens, they continue to feed on whatever insects are present (e.g., caterpillars, beetles, mosquitoes, moths).\nBeneficial Insects vs. Pests: While mantises do consume insects that might be garden pests (like caterpillars eating foliage), they are indiscriminate and may also eat pollinators, such as bees and butterflies.\nLight Sources: In urban areas, mantises can be drawn to outdoor lights at night, where moths and other insects congregate. They’ll perch nearby to hunt.\nDespite the broad diet, mantises are often viewed as beneficial predators in gardens, helping to keep certain insect populations in check.	Day and Night. Seasonal Presence: Mantises in Japan typically hatch from egg cases (oothecae) ​​in late spring (around April–May, depending on local climate). They then mature through the summer and can be readily observed hunting in gardens from mid-summer into early autumn.\nPeak Activity: Summer–Early Autumn: Adults are most active and visible.\nAutumn: Mating occurs, and females lay egg cases before the weather cools.\nOverwintering: Eggs remain in protective foam-like cases (oothecae) ​​attached to twigs, fences, or walls. The adults generally do not survive the winter.\nIn domestic gardens, you'll often notice nymphs in spring, rapidly growing into adults by late summer. By early autumn, you may see large, mature mantises hunting or mating.	Native. Several native species (e.g. Tenodera aridifolia).	Name Origin: カマキリ (kamakiri) combines the words 鎌 (kama, “sickle” or “scythe”) and 切る (kiru, “to cut”), referencing their prominent, scythe-like front legs.\nSymbolism: Mantises can symbolize stillness, patience, and focus due to their ambush hunting style.\nTraditional Views:\nSome older Japanese beliefs regarded the mantis’s fierce stance as embodying bravery or even recklessness (taking on threats larger than itself).\nIn certain folklore, they have been depicted with a mix of awe and wariness, because despite their small size, they are formidable predators.\n\nGardening & Pest Control: Many gardeners welcome mantises as natural pest controllers, although they can also eat beneficial insects.\nIn Popular Culture: Mantises sometimes appear in manga, anime, or children's books, often highlighting their striking form and predatory prowess.\nOverall, praying mantises hold a largely positive cultural status in Japan, seen as fascinating creatures that exemplify nature’s balance and the cycle of life in gardens and beyond.	\N	Wonderful blog about keeping mantis as a pet in the garden: https://note.com/timor07/n/n47fe6441441a	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.395723+00	\N
3	Eurasian Tree Sparrow	スズメ	Passer montanus	Birds	[{"path": "Animal/Eurasian Tree Sparrow - Animal Picture.webp", "type": "animal", "original_name": "Eurasian Tree Sparrow"}, {"path": "Animal/Eurasian Tree Sparrow - Garden Picture.webp", "type": "garden", "original_name": "Eurasian Tree Sparrow"}, {"path": "Animal/Eurasian Tree Sparrow - Natural Habitat Picture.webp", "type": "habitat", "original_name": "Eurasian Tree Sparrow"}, {"path": "Animal/Eurasian Tree Sparrow - Urban Picture.webp", "type": "urban", "original_name": "Eurasian Tree Sparrow"}]	Omnivorous	Seeds and Grains: Primarily consumes a variety of seeds (wild grasses, weeds, cereals).\nInsects and Invertebrates: Especially important during the breeding season (spring and early summer), when adults feed insects to their chicks for protein.\nIn more natural or rural habitats, tree sparrows forage in fields and woodlands, taking advantage of abundant seed-producing plants and insect-rich areas.	Scraps and Leftovers: In towns and cities, tree sparrows have adapted to feed on food waste, breadcrumbs, or rice grains found around houses, parks, and outdoor eateries. Bird Feeder Offerings: Sunflower seeds, millet, and other grains commonly provided in backyard bird feeders. Gardens: They may also seek out seeds from ornamental plants or small insects found among garden vegetation. Their flexible diet allows them to thrive in human-dominated landscapes, making them frequent visitors to household gardens.	Year-Round Presence: The Eurasian Tree Sparrow is a non-migratory resident throughout most of Japan, so it can be seen in domestic gardens in all seasons.\nDiurnal Activity: Typically active during daylight hours. Peak feeding often occurs in the early morning and late afternoon.\nBreeding Season: In Japan, breeding generally spans from spring (around March or April) into early summer. During this time, they may be more conspicuous and vocal in gardens as they forage for insect prey to feed their young.\nEven though they remain in gardens year-round, you may notice the sparrows’ behavior change slightly across seasons—focusing more on insects in spring/summer and shifting to seeds or human-provided food sources in autumn/winter when insects are scarce.	Native (Eurasia, including Japan).	One famous Japanese folktale, Shita-kiri Suzume (舌切り雀, “The Tongue-Cut Sparrow”), features a sparrow as a central character. This story traditionally conveys themes of kindness, greed, and consequences.\nSymbolic Presence: Sparrows often appear in Japanese children’s songs, literature, and art, symbolizing everyday life, cheerfulness, and the ordinary joys found in close proximity to humans.\n\nCommon Sight: The Eurasian Tree Sparrow’s chirping and flitting about are part of the sonic and visual landscape of many Japanese towns and villages.\nCultural Associations: Sometimes they’re simply viewed as friendly garden visitors, while in older times, sparrows could be considered pests for eating crop seeds—hence references in agricultural contexts.	\N	Personal blog, differences about city sparrows and country sparrows: https://pajaro-pajarito.hatenablog.com/entry/sparrowcityandcountry\n\nSparrow bathing: https://plaza.rakuten.co.jp/mattyan328/diary/202306060001/\n\nDuskin blog about sparrows: https://shimotoku.net/service/%E3%81%99%E3%81%9A%E3%82%81%E3%81%AE%E5%AF%BE%E7%AD%96%E6%96%B9%E6%B3%95%E3%82%92%E8%80%83%E3%81%88%E3%81%A6%E8%A6%8B%E3%82%8B/\n\nCanon blog about sparrows! Really good video in the end:\nhttps://global.canon/ja/environment/bird-branch/photo-gallery/suzume/	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.395723+00	\N
4	Large-billed Crow	ハシブトガラス	Corvus macrorhynchos	Birds	[{"path": "Animal/Large-billed Crow - Animal Picture.webp", "type": "animal", "original_name": "Large-billed Crow"}]	Omnivorous, opportunistic scavenger	Insects, small animals, eggs of other birds, fruits, nuts, seeds, carrion	Leftover food from trash, roadkill, small animals/pets, discarded kitchen scraps, food offerings at shrines.	Primarily diurnal, active during daylight hours; can be noisy at dawn.	Native (East Asia)	- Symbol & Folklore: Crows (particularly the three-legged crow “Yatagarasu”) appear in Japanese mythology, often as guides.\n- Modern Perception: Viewed as both clever and a nuisance (raiding garbage, noisy calls).\n- Urban Adaptation: Their presence in cities has become symbolic of wildlife adapting to urban life. Very visible in parks, neighborhoods, picking through trash.\nEfforts by local wards to reduce crow–human conflict (e.g., better waste management)	\N	\N	\N	\N	Behavior in Residential Gardens: They often perch on rooftops, utility poles, or trees, and may forage in gardens for insects or fallen fruit. They are particularly known for rummaging through trash bags if food scraps aren’t secured.	2026-02-12 13:56:17.395723+00	\N
5	Carrion Crow	カラス	Corvus corone	Birds	[{"path": "Animal/Carrion Crow - Animal Picture.webp", "type": "animal", "original_name": "Carrion Crow"}]	Omnivorous, opportunistic scavenger	Insects, small animals, eggs of other birds, fruits, nuts, seeds, carrion	Leftover food from trash, roadkill, small animals/pets, discarded kitchen scraps, food offerings at shrines.	Primarily diurnal, active during daylight hours; can be noisy at dawn.	Typically refers to Carrion Crow in context, Native (Eurasia).	- Symbol & Folklore: Crows (particularly the three-legged crow “Yatagarasu”) appear in Japanese mythology, often as guides.\n- Modern Perception: Viewed as both clever and a nuisance (raiding garbage, noisy calls).\n- Urban Adaptation: Their presence in cities has become symbolic of wildlife adapting to urban life. Very visible in parks, neighborhoods, picking through trash.\nEfforts by local wards to reduce crow–human conflict (e.g., better waste management). Coexists with the large-billed crow; both can be seen in the city.\nTends to be a bit less aggressive and forages more quietly along rivers, farmland edges.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
21	Little Egret	コサギ	Egretta garzetta	Birds	[]	Carnivorous (small fish, crustaceans, aquatic insects, tadpoles)	Frequents shallow water—coastal shallows, estuaries, rivers—to spear small aquatic prey	In Tokyo, often along smaller urban rivers/ponds, sometimes in groups. Very visible with bright white plumage	Primarily diurnal, actively stalking prey in daylight; can join communal roosts at night with other herons	Native.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
6	American Cockroach	ゴキブリ	Periplaneta americana	Insecta	[{"path": "Animal/American Cockroach - Animal Picture.webp", "type": "animal", "original_name": "American Cockroach"}]	Omnivore, scavenger	Decaying matter, plant debris, small scraps	Kitchen scraps, garbage	Primarily nocturnal	Mixed. Some forest roaches are native, common urban pest species (e.g. Periplaneta americana) are introduced (Americas/elsewhere).	Universally disliked. In Japan, cockroaches are stereotyped in media as unwanted pests, prompting comedic or horror-themed references.\nFew cultural “redeeming” aspects; generally associated with uncleanliness.\nRelevance in Tokyo:\nThrive in warm, humid summers, abundant in older buildings, restaurant districts, and sewers.\nMany TV commercials for rock traps (e.g., “Gokiburi Hoi Hoi”).	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
7	Abura Cicada	アブラゼミ	Graptopsaltria nigrofuscata	Insecta	[{"path": "Animal/Abura Cicada - Animal Picture.webp", "type": "animal", "original_name": "Abura Cicada"}]	Sap-feeder (xylem)	Sap from various native trees in sunny areas (oaks, maples, etc.)	Sap from parks and street trees, including ornamental species	July-August, height of mid/late summer; Late morning to late afternoon, often quite vocal from mid-morning.\nThey can also be heard in the early evening (before sunset), but generally quiet down as light fades.	Native to Japan.	Iconic sound of Japanese summer; symbolizes season’s transition. Cultural Integration:\nCicadas (semi) are iconic for Japanese summers. Their calls define the seasonal soundscape, featured in anime, dramas, and summer references.\nAbura-zemi’s call is sometimes described as “shshsh,” reminiscent of frying in oil (“abura” means “oil”).\nRelevance in Tokyo:\nCommon in trees in neighborhoods and parks, especially mid- to late summer.\nThe overwhelming cicada chorus is deeply nostalgic in Japanese culture.	\N	\N	\N	\N	Temperature & Sunlight:\nMost cicadas are ectothermic (cold-blooded), needing a certain warmth and sunlight to become fully active.\nNighttime:\nGenerally, Japanese cicadas are not active at night. Only Higurashi extends its call into twilight, but not into full darkness.\nWeather Influence:\nOn cloudy or rainy days, they tend to stay quieter or become inactive, calling sporadically if humidity and temperature allow.	2026-02-12 13:56:17.395723+00	\N
8	Minmin Cicada	ミンミンゼミ	Tanna japonensis	Insecta	[{"path": "Animal/Minmin Cicada - Animal Picture.webp", "type": "animal", "original_name": "Minmin Cicada"}]	Sap-feeder (xylem)	Sap from native broadleaf trees (e.g. maples, oaks, zelkovas) in forests and woodlands	Sap from ornamental or street trees (e.g. sidewalk trees)	Usually from mid/late July to August (peak summer); Mid-morning to mid-afternoon on sunny days.\nThey tend to start calling once it’s warm (late morning) and continue through the hottest part of the day.\nTheir loud, continuous “min-min-min” song can peak around midday.	Native to Japan.	Its loud “min-min-min” call is symbolic of midsummer heat, often used in media to indicate midday scorching sun.\nJapanese culture references the minmin-zemi’s continuous call for a sense of “hot summer.”\nRelevance in Tokyo:\nFound in many park trees; the high-pitched drone is inseparable from Tokyo’s summer atmosphere.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
9	Evening Cicada	ヒグラシ	Oncotympana maculaticollis	Insecta	[{"path": "Animal/Evening Cicada - Animal Picture.webp", "type": "animal", "original_name": "Evening Cicada"}]	Sap-feeder (xylem)	Sap from trees in damp forest areas (oaks, beeches, etc.)	Sap from shady trees in parks/wooded neighborhoods	Active June-September; Early morning and late afternoon/early evening, giving them the nickname “evening cicada.”\nTheir melancholic “kana-kana” call is typically heard during twilight hours (dawn or dusk), although they can occasionally call at other times if conditions are right.	Native to Japan.	Its melancholic “kana-kana” call at dawn/dusk is romanticized in poetry and nostalgic for rural or quiet suburban scenes.\nFrequently used in anime/dramas to evoke twilight or a pensive mood.\nRelevance in Tokyo:\nPresent in wooded parks or quieter neighborhoods.\nThe “twilight chorus” can still be heard in certain green belts or temple areas.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
10	Niinii Cicada	ニイニイゼミ	Platypleura kaempferi	Insecta	[{"path": "Animal/Niinii Cicada - Animal Picture.webp", "type": "animal", "original_name": "Niinii Cicada"}]	Sap-feeder (xylem)	Prefer trees/shrubs in open forest areas	Street trees and residential gardens	Active Period Early summer (June) to mid/late August; relatively soft “niinii” song. Morning to early afternoon in warm weather; Their “nii-nii” sound is softer compared to other species.\nThey tend to start relatively early in the morning once the temperature rises, but become less active in intense midday heat.	Native to Japan.	Cultural Integration:\nIts soft “nii-nii” call is less intense than other cicadas, sometimes overshadowed by the minmin or abura.\nNonetheless, it’s recognized as an early summer species, bridging late June to July.\nRelevance in Tokyo:\nOften emerges earlier, found near shrubs and low trees in parks.\nLess “famous” but still part of the seasonal insect chorus.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
11	Tsukutsuku-bōshi Cicada	ツクツクボウシ	Meimuna opalifera	Insecta	[{"path": "Animal/Tsukutsuku-bōshi Cicada - Animal Picture.webp", "type": "animal", "original_name": "Tsukutsuku-bōshi Cicada"}]	Sap-feeder (xylem)	Sap from various trees in light woods	Ornamental trees in gardens and streets, adapting to residential environments	August-September (sometimes until October); Late morning to afternoon during August and September.\nTheir characteristic “tsuku-tsuku-bōshi” call often becomes more noticeable as summer wanes; they may continue into the late afternoon.	Native to Japan.	The “tsuku-tsuku-bōshi” call is strongly tied to late summer and the approach of autumn.\nEmphasized in popular culture as a sign that summer holidays are ending.\nRelevance in Tokyo:\nBecomes audible in August–September.\nNostalgic for students returning to school, an iconic “end of summer” symbol.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
12	Japanese Moon Moth	オオミズアオ	Actias artemis	Insecta	[{"path": "Animal/Japanese Moon Moth - Animal Picture.webp", "type": "animal", "original_name": "Japanese Moon Moth"}]	Larvae: Herbivorous (feed on leaves of broadleaf trees)\nAdults: Usually do not feed (rudimentary mouthparts or none)	Larvae feed on oaks, cherries, chestnuts, and other broadleaf species in wooded areas	Larvae can use ornamental or street trees (cherry, persimmon, etc.) in Tokyo suburbs; adults attracted to lights	Early to mid-summer (June–August); nocturnal as adults, often drawn to porch or streetlights at night	Native	Large, pale-green “moonlike” wings can appear in art or literature as mystical or ephemeral.\nNot as famous as the “silk moths” for sericulture, but admired by insect enthusiasts.\nRelevance in Tokyo:\nAttracted to lights on summer nights in suburban/green areas.\nSymbolizes the short, fragile adult lifespan, sometimes used in haiku or natural journaling.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
22	Intermediate Egret	チュウサギ	Ardea intermedia	Birds	[]	Carnivorous (fish, frogs, insects—between Great and Little Egret in size/hunting)	Wetlands, rice paddies, shallow lakes—catches small fish, amphibians, insects in or near water	Not as abundant as Great or Little Egret but still seen around fields or shallow park ponds in Tokyo region	Diurnal; hunts mostly in daytime, roosts communally with other egrets/herons at night	Native.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
13	Japanese Silk Moth	ヤママユ	Antheraea yamamai	Insecta	[{"path": "Animal/Japanese Silk Moth - Animal Picture.webp", "type": "animal", "original_name": "Japanese Silk Moth"}]	Larvae: Herbivorous (various broadleaf trees)\nAdults: Typically do not feed or feed minimally	Larvae feed on oaks, maples, walnuts in forest edges	Larvae may appear on garden/park trees (maples, zelkova); adults occasionally fly to lights in city areas	Mid to late summer (July–September); adults are nocturnal, large “silk moths” often noticed around bright outdoor lights at night	Native	Historically used for Tussar silk (wild silk). Not as commercial as the domesticated Bombyx mori, but known in rural sericulture traditions.\nConsidered a “treasure insect” in some local folklore.\nRelevance in Tokyo:\nNot super common in dense city centers, but found where suitable host trees remain.\nFor some insect collectors, it’s a prized find.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
14	Convolvulus Hawk Moth	スズメガの一種	Agrius convolvuli	Insecta	[{"path": "Animal/Convolvulus Hawk Moth - Animal Picture.webp", "type": "animal", "original_name": "Convolvulus Hawk Moth"}]	Larvae: Herbivorous (esp. Convolvulaceae such as bindweeds, sweet potatoes)\nAdults: Nectar-feeding (long proboscis)	Larvae prefer sweet potato vines, other Convolvulaceae in farmland or wild creepers	Larvae can be found on sweet potato patches in city gardens or morning glory vines; adults feed at night on garden flowers	Late spring to early autumn (around June–October); primarily nocturnal/crepuscular feeders, often at porch lights	Mostly Native or migratory within Asia. Not introduced in the invasive sense.	Hawk moths in general are known as スズメガ (suzume-ga), literally “sparrow moth,” referencing robust bodies.\nLess direct folklore but recognized by farmers for caterpillars feeding on sweet potatoes, morning glories, etc.\nRelevance in Tokyo:\nStrong fliers, often appear around bright lights at night.\nTheir large caterpillars can damage sweet potato vines in urban gardens.	\N	\N	\N	\N	Why common in Tokyo?\n\nSweet potatoes (satsumaimo), morning glories (asagao), and ornamental vines are common, providing larval food. Hawk moths are strong fliers, so they appear even in urban centers at night-lights.	2026-02-12 13:56:17.395723+00	\N
15	Oriental Leafworm Moth (Tobacco Cutworm)	タバコガ / ヨトウガ	Spodoptera litura	Insecta	[{"path": "Animal/Oriental Leafworm Moth (Tobacco Cutworm) - Animal Picture.webp", "type": "animal", "original_name": "Oriental Leafworm Moth (Tobacco Cutworm)"}]	Larvae: Polyphagous herbivore (feeds on many crops)\nAdults: Possibly nectar-feeding but often minimal	Larvae devastate farmland crops (vegetables, tobacco, legumes), highly regarded as a pest in many rural fields	Larvae are a common pest on home-garden vegetables (tomato, pepper, leafy greens) in Tokyo; adults fly to artificial lights at night	Warm months (May–October); adults are nocturnal; larvae active in mid-late summer, causing garden damage	Native to Asia (including Japan).	Known mainly as an agricultural pest; not a major symbolic insect.\nIn gardening magazines, it’s often cited as a common “enemy” for vegetable growers.\nRelevance in Tokyo:\nFeeds on garden vegetables (tomatoes, peppers), frequently invading balcony gardens.\nA prime example of how rural pests also adapt to the city.	\N	\N	\N	\N	Why common in Tokyo?\n\nEven small vegetable plots or balcony pots can be attacked by these caterpillars; they adapt well to urban environments.	2026-02-12 13:56:17.395723+00	\N
16	Bee Hawk Moth / Hummingbird Clearwing	オオスカシバ	Cephonodes hylas	Insecta	[]	Larvae: Herbivorous (often on vines like Paederia)\nAdults: Daytime nectar feeders (long proboscis)	Larvae feed on native Rubiaceae vines in forest/forest edge; adults pollinate flowers during daytime flights	Larvae can use ornamental vines if present; adults commonly seen in flower gardens by day, mistaken for bees or tiny hummingbirds	Late spring–autumn (May–September); day-active and easily spotted around garden flowers	Native to Asia (Japan included).	Attracts attention for its daytime flight and “bee-like” or “hummingbird-like” hovering, sometimes surprising people.\nNot deeply embedded in folklore but occasionally featured in nature programs for its unique pollinating behavior.\nRelevance in Tokyo:\nVisits flowers in gardens by day; the “wow factor” insect.\nThe caterpillars can feed on ornamental vines (e.g., Paederia) near homes.	\N	Personal experience about raising the animal: https://ameblo.jp/hei-ok/entry-12758971183.html	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
17	American White Moth / Fall Webworm	American White Moth / Fall Webworm	Hyphantria cunea	Insecta	[]	Larvae: Polyphagous herbivore (defoliator of many tree/plant leaves)\nAdults: Typically nectar-feeding (though they may feed minimally)	Larvae feed on a wide range of deciduous trees in fields and forest edges, forming large silken webs	Larvae often appear on ornamental street trees, fruit trees, or garden shrubs; very visible “web nests”	Late spring–autumn (multiple generations; larvae seen from early summer to fall); adults are nocturnal	Introduced from North America.	Not revered—strictly seen as a harmful foreign pest that forms unsightly web nests in trees.\nJapanese name literally “American White Moth.”\nRelevance in Tokyo:\nInfests park and street trees, covering branches with silken “tents”; defoliates leaves.\nCity pest-control efforts often target removing webs on decorative/ornamental trees.	\N	\N	\N	\N	Highlights\nOrigin: Native to North America, introduced to Japan, it has become an urban and rural pest.\nSymptoms in the garden: Large webs on branches, where caterpillars gather and devour leaves quickly.\nControl: Usually by removing the “web nests” manually or using biological/selective control to prevent spreading.\nWhy is it relevant in Tokyo?\n\nIt is common in parks, residential backyards, and street trees, causing aesthetic impact and possible damage to vegetation.\nEasy to spot when caterpillars form their white “tents,” attracting the attention of residents.\nSo, if your spreadsheet seeks to list moth species (and their caterpillars) that impact the urban landscape in Tokyo, Hyphantria cunea (American White Moth/Fall Webworm) is undoubtedly a pertinent addition.	2026-02-12 13:56:17.395723+00	\N
18	Cat (domestic)	猫 (Neko)	Felis catus	Mammalia	[]	Carnivorous (domesticated)	Small prey (rodents, birds), provided cat food	Cat food, occasional hunting of local fauna	Crepuscular/any time	Introduced, originally from the Near East / Middle East, spread globally with humans.	Beloved pets; “maneki neko” as a luck symbol; also free-roaming cats can affect wildlife	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
19	Grey Heron	アオサギ	Ardea cinerea	Birds	[{"path": "Animal/Grey Heron - Animal Picture.webp", "type": "animal", "original_name": "Grey Heron"}]	Carnivorous (fish, amphibians, small reptiles, insects, etc.)	Feeds in rivers, lakes, marshes—stalks fish and frogs in shallow waters	Often seen in Tokyo’s rivers (Edogawa, Tamagawa), large ponds in public parks, hunting for fish	Primarily diurnal; active from early morning to dusk; roosts communally at night	Native.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
20	Great Egret	ダイサギ	Ardea alba	Birds	[{"path": "Animal/Great Egret - Animal Picture.webp", "type": "animal", "original_name": "Great Egret"}]	Carnivorous (fish, frogs, crustaceans, insects)	Hunts in wetlands, shallow rivers, or flooded fields, capturing prey with quick bill thrust	In Tokyo, commonly spotted near canals, ponds, or even drainage ditches, picking off small fish/frogs	Diurnal, though it may forage into twilight if undisturbed; roosts in trees or reedbeds at night	Native.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
23	Black-crowned Night Heron	ゴイサギ	Nycticorax nycticorax	Birds	[]	Carnivorous (fish, frogs, small rodents, invertebrates—varies by site)	Feeds along marshes and riverbanks at dusk or night	In Tokyo, often roosts by day in tall trees near water, then hunts in canals/ponds at twilight/night	Nocturnal/crepuscular: remains hidden or roosting during day, becomes active at dusk for feeding	Native.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
24	Wasp	スズメバチ / ハチ	Vespa spp., Vespula spp., etc.	Insecta	[]	Predatory, somewhat omnivorous	Insects, spiders, nectar	Garbage, food scraps (protein & sugar sources)	Spring–autumn, peak in summer	Mostly Native (e.g. Vespa mandarinia, Polistes chinensis are native).	Some wasps (esp. Vespa mandarinia) hold caution/fear; also revered for strength	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
25	Japanese Giant Hornet	オオスズメバチ	Vespa mandarinia	Insecta	[]	Predatory: hunts other insects (incl. honey bees), also seeks sugary liquids (sap, fruit)	Forest edges, rural fields—nests often in tree hollows or underground	Will nest in suburban shrubby areas, hunts bees, locates soda/juice or fruit scraps in trash	Spring to autumn; very active in late summer when colony is large, can be aggressive	Native to Japan.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
26	Paper Wasp (Polistes Chinensis)	キアシナガバチ	Polistes chinensis	Insecta	[]	Predatory (caterpillars, insects) + visits sweet liquids (nectar, sap)	Fields, gardens—build small paper nests under eaves or in shrubs, hunting caterpillars for larvae	Common in Tokyo’s residential eaves, balconies; feed on garden pests, also take sugar from fruits/nectar	Spring to autumn; peak activity in summer, dies off in winter except overwintering queens	Native.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
27	Japanese Honey Bee	にほんミツバチ (Mitsubachi)	Apis cerana japonica	Insecta	[{"path": "Animal/Japanese Honey Bee - Animal Picture.webp", "type": "animal", "original_name": "Japanese Honey Bee"}]	Nectar & pollen (pollinator)	Forest flowers, wild plants—colonies in hollow trees or logs	Takes nectar/pollen from ornamental flowers, rooftop gardens, park plantings in Tokyo	Spring to autumn (colony less active in winter)	Native subspecies (Apis cerana japonica).	Highly valued as pollinators; honey and pollination are culturally appreciated	\N	\N	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.395723+00	\N
28	Asian Tiger Mosquito	ヒトスジシマカ	Aedes albopictus	Insecta	[{"path": "Animal/Asian Tiger Mosquito - Animal Picture.webp", "type": "animal", "original_name": "Asian Tiger Mosquito"}]	Females require blood meals (mammals/humans) for egg production; also plant nectar	Breeds in small water accumulations in forests, near standing water in natural areas	In Tokyo, breed in small water containers, flower pots, drains, etc.; bite humans in gardens/parks; vector of diseases	Warmer months (roughly May–October), most active dawn/dusk and shady daytime	Native or long-established in Asia (including Japan).	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
29	Common House Mosquito	アカイエカ	Culex pipiens pallens	Insecta	[{"path": "Animal/Common House Mosquito - Animal Picture.webp", "type": "animal", "original_name": "Common House Mosquito"}]	Females need blood meals; also feed on plant juices; males feed only on nectar or juices	Natural ponds, marshes—larvae develop in standing water	Very common in Tokyo water containers (buckets, drainage, etc.); bites humans/pets at night in homes	Late spring to early autumn; mostly nocturnal	Native to East Asia, including Japan.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
30	Feral Pigeon	ハト	Columba livia domestica	Birds	[]	Omnivorous/scavenger	Seeds, grains, occasional insects	Food scraps, seeds around urban areas, leftover bread	Diurnal	Introduced from rock dove origins in Europe/North Africa	Common urban bird worldwide; sometimes regarded as pests or mess makers	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
31	Barn Swallow	ツバメ	Hirundo rustica	Birds	[{"path": "Animal/Barn Swallow - Animal Picture.webp", "type": "animal", "original_name": "Barn Swallow"}]	Insectivorous	Flying insects	Same, catching insects near streetlights or open areas	Diurnal, migratory (spring–summer in Japan)	Native (migratory in Asia).	Symbol of good luck; seeing nests at home is considered auspicious	\N	\N	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.395723+00	\N
32	White-cheeked Starling	ムクドリ	Spodiopsar cineraceus	Birds	[{"path": "Animal/White-cheeked Starling - Animal Picture.webp", "type": "animal", "original_name": "White-cheeked Starling"}]	Omnivorous	Insects, fruits, berries, small invertebrates	Leftovers, food scraps, fruit in gardens	Diurnal	Native to East Asia.	Large flocks can be noisy; some consider them pests, yet they are also seen as part of urban wildlife	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
33	Argentine Ant	アルゼンチンアリ	Linepithema humile	Insecta	[]	Omnivorous (sugars, proteins, “opportunistic”)	Feeds on honeydew from aphids, small insects, plant secretions in warmer climates	Common household/garden pest: seeks sweet foods in kitchens, garbage, potted plants in Tokyo suburbs.	Mostly year-round in heated buildings, outdoors from spring to autumn; active day & night	Introduced from South America.	Common, minor pest if they invade homes; also ecologically important as decomposers	\N	\N	\N	\N	Argentine Ant (an invasive species often found in Tokyo)	2026-02-12 13:56:17.395723+00	\N
34	Japanese Carpenter Ant	クロオオアリ	Camponotus japonicus	Insecta	[]	Omnivorous: collects sugary exudates (honeydew), preys on small insects, scavenges proteins and carbohydrates	In forested areas, feeds on honeydew from aphids on trees/shrubs, small insects, plant sap, dead arthropods	In Tokyo gardens/yards: seeks leftover sweets, fruit scraps, pet food; may nest under pavement stones, garden soil, or in wooden structures	Spring–autumn (peak activity in warm months; slows down in winter; mostly diurnal, but can occur at various times)	Native.	\N	\N	\N	\N	\N	Why It’s Called Carpenter \nAnt: Although Camponotus japonicus does not always “carve out” wood as extensively as some other carpenter ants, they can nest in soft/decayed wood or in crevices, which occasionally leads to structural concerns if they inhabit building materials.\nInteraction in Urban Settings:\nBeneficial in that they predate some pests (small insects), help clean up organic debris.\nPotential Nuisance if colonies expand indoors or forage aggressively for human food sources.\nAppearance: Large, blackish ants (workers ~6–10 mm, majors/larger workers even bigger), often forming visible foraging trails.\nThis species is part of the native ant fauna in Japan, differentiating it from some invasive ants (like the Argentine ant) also found in Tokyo.	2026-02-12 13:56:17.395723+00	\N
35	Joro Spider	ジョロウグモ	Trichonephila clavata	Arachnida	[]	Carnivorous (web-building predator)	Catches flying insects (moths, mosquitoes, small flies) in woodland edges, gardens, etc.	Common in Tokyo gardens, parks, building eaves; beneficial for controlling insect pest	Late summer–autumn is peak (adults visible in webs); juveniles appear in spring, mature by late summer	Native to East Asia (including Japan).	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
36	Asian Lady Beetle / Harlequin Ladybird	テントウムシの一種	Harmonia axyridis	Insecta	[]	Predatory (mainly aphids); some species also feed on nectar/pollen in certain phases	Various aphid-infested plants in fields, forest edges; major beneficial insect controlling pests	Gardens, balconies with roses, vegetables—eating aphids; can overwinter in houses in cooler months	Spring–autumn (active), can cluster indoors to overwinter (late autumn–winter)	Some native species (e.g. Coccinella septempunctata, Harmonia axyridis is also East Asian native). A few introduced (rare).	Considered lucky in many cultures; in Japan, a sign of good weather or childlike innocence	\N	\N	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.395723+00	\N
37	Japanese Rhinoceros Beetle	カブトムシ	Trypoxylus dichotomus	Insecta	[]	Sap-feeder (adult), decomposer (larva)	Tree sap, fruits, decaying wood	Overripe fruit, ornamental tree sap, sold as pets	Summer (adults), night	Native.	Iconic summer insect for children; sold in pet shops; symbol of summer	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
38	Stag Beetle	クワガタムシ	Família Lucanidae	Insecta	[]	Sap-feeder (adult), decomposer (larva)	Tree sap, rotting wood	Similar to rhinoceros beetle, might feed on fruit in gardens	Summer (adults), night	Native. Various local species.	Iconic summer insect for children; sold in pet shops; symbol of summer	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
39	Meghimatium Fruhstorferi (Slug)	ナメクジ	Meghimatium fruhstorferi	Gastropoda	[{"path": "Animal/Meghimatium Fruhstorferi (Slug).webp", "type": "reference", "original_name": "Meghimatium Fruhstorferi (Slug)"}]	Herbivore/detritivore: eats decaying plant matter, tender leaves, fungi	Forest floors, damp leaf litter—feeds on algae, decaying organic matter	In Tokyo gardens, it feeds on young leaves, seedlings, rotting debris; active on moist nights	Mostly nocturnal; thrives in rainy season (late spring–summer). Preferred damp conditions	Mixed (some native, some introduced from Europe, e.g. Deroceras sp.).	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
40	Japanese Land Snail	カタツムリ	Euhadra quaesita	Gastropoda	[{"path": "Animal/Japanese Land Snail - Animal Picture.webp", "type": "animal", "original_name": "Japanese Land Snail"}]	Herbivore/detritivore: eats leaves, decaying organic matter	Moist forest floors, leaf litter, feeds on algae/fungi on logs and stones	In Tokyo gardens, you can eat young leaves, ornamental plants; found in shaded damp corners	Primarily nocturnal or after rain; more visible in rainy season (June). Overwinters in cold months	Mixed. Euhadra species are native; Giant African snail is introduced if found.	Symbol of rainy season in Japan; sometimes considered cute (mascot characters)	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
41	Field Cricket / Two-spotted Cricket	エンマコオロギ	Gryllus bimaculatus	Insecta	[]	Omnivorous (plant debris, leaves, insect remains)	Plant parts, seeds, small dead insects	Fallen plant matter, food scraps, light organic waste.	August to October (most active in late summer and early autumn). Nocturnal – sings at night, emitting rhythmic and continuous sounds.	Native to Japan and East Asia	Highly valued as a sonic symbol of autumn in Japan; present in poems, haikus, and ambient sound creations (環境音); also kept as a pet or for feeding reptiles.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
42	Japanese Firefly	ホタル	Luciola cruciata	Insecta	[{"path": "Animal/Japanese Firefly - Animal Picture.webp", "type": "animal", "original_name": "Japanese Firefly"}]	Carnivorous (larvae eat aquatic snails); adults consume little or no nectar.	Larvae: snails, small mollusks found in damp areas.	With difficulty — it needs humid and clean environments with native vegetation.	Early June (peak observation: end of the rainy season). Nocturnal — flashes at night to attract mates.	Native to Japan.	A symbol of ephemerality, love, and purity; frequently represented in festivals (e.g., Hotaru Matsuri) and in haiku; associated with early summer and silent night.	\N	\N	\N	\N	Rare in common urban environments, but can be attracted by:\n\nHumid and dark environments (proximity to ponds or small waterways)\n\nAbsence of pesticides and artificial lighting\n\nNative flora or edges of well-tended vegetable gardens\n\nMore easily seen in spaces with careful environmental control or restorative gardens.\n\nPoetic and sensory element.\n\nMay appear on warm, humid nights when there is little light and native plants are present.\n\nCan be used as a visual reward when ecological balance is restored.\n\nExample condition: “Appears if there is no artificial light, pesticides, and humidity.”	2026-02-12 13:56:17.395723+00	\N
43	Japanese Earthworm	ミミズ	Amynthas hilgendorfi	Annelida	[]	Detritivore: consumes decaying organic matter and soil	Decomposing leaf litter, dead roots in forest soil	Gardens, potted soils—help aerate and recycle organic debris in urban flowerbeds	Year-round in moist soil, though less active in cold winter or very hot/dry summer	Mixed. Many native (e.g. Amynthas spp.), some introduced.	Important for soil health and fertility	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
44	Roly-poly	ダンゴムシ	Armadillidium vulgare	Crustacea	[]	Detritivore	Decomposing leaves, wood	Decomposing leaves, wood, found under pots, rocks, damp areas	Mostly nocturnal, year-round	Introduced from Europe if referring to Armadillidium vulgare. Some isopods are native, but the common pill bug in gardens is typically introduced.	Minimal direct cultural meaning; sometimes liked by kids (rolling into a ball)	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
45	House Centipede	ゲジゲジ	Scutigera coleoptrata	Chilopoda	[]	Predatory	Insects, spiders, small arthropods	Insects, spiders, small arthropods, can be found in bathrooms, damp corners of homes	Nocturnal	Commonly introduced from the Mediterranean region; now cosmopolitan.	Mixed reactions: fear vs. beneficial insect control	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
46	House Gecko	ヤモリ	Hemidactylus frenatus	Reptilia	[]	Insectivorous	Moths, mosquitoes, small insects	Same, near porch lights at night	Nocturnal	Some species are native (e.g. Gekko japonicus); the common house gecko (Hemidactylus frenatus) is introduced or long-established from Southeast Asia.	Considered lucky in some folklore; “Yamori” literally means “house protector”	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
47	Japanese Five-lined Skink	ニホントカゲ	Plestiodon japonicus	Reptilia	[]	Insectivorous	Spiders, insects, snails	Same, garden insects	Diurnal, warmer months	Native.	Common backyard reptile, bright tail in juveniles	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
48	Japanese Tree Frog	シマアオガエル	Dryophytes japonicus	Amphibia	[{"path": "Animal/Japanese Tree Frog - Animal Picture.webp", "type": "animal", "original_name": "Japanese Tree Frog"}]	Insectivorous	Mosquitoes, flies, small insects	Similar, thriving in moist garden corners	Mostly nocturnal, spring–summer	Native.	Famous for chirping in rainy season. Símbolo de verão e som noturno; aparece em haicais e mangás.	\N	\N	\N	\N	Onde aparece: vasos grandes com sombra e umidade, tanques, paredes próximas a plantas. Canta muito no verão, e é pequeno (2–4 cm), verde-claro.	2026-02-12 13:56:17.395723+00	\N
49	Norway Rat	ドブネズミ	Rattus norvegicus	Mammalia	[]	Omnivorous (grain, meat scraps, any food source)	Originally near riverbanks, fields; in the wild, feeds on seeds, small invertebrates	In Tokyo sewers, garbage areas; can infest gardens near compost or leftover pet food	Nocturnal mostly; active year-round, seeking warm spaces in winter	Introduced from northern Eurasia (originally Europe/Asia, not native to Japan).	Considered pests for hygiene reasons; minimal positive cultural significance.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
50	Roof Rat	クマネズミ	Rattus rattus	Mammalia	[]	Omnivorous (fruits, grains, garbage, small insects)	Prefers higher, drier habitats, sometimes in fields or woodlands	Common in attics, upper floors, or behind walls in Tokyo. Eats scraps, fruits, pet food, etc.	Nocturnal; active all year, often nesting in building roofs or high places	Introduced from tropical Asia / India region.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
51	Stray Cat	野良猫　 (noraneko)	Felis catus (feral populations)	Mammalia	[]	Carnivorous/scavenger	Small rodents, birds	Garbage scraps, handouts from neighbors	Mostly nocturnal	Same as domestic cat, introduced from Near East / Middle East.	Mixed feelings: some feed them, others see them as pests.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
52	Raccoon	アライグマ	Procyon lotor	Mammalia	[]	Omnivorous/scavenger	Fruits, insects, small vertebrates, nuts	Garbage, pet food, garden crops	Primarily nocturnal	Introduced from North America.	Invasive species in Japan; gained popularity from anime “Rascal,” but now a major ecological concern	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
53	Japanese Weasel	イタチ	Mustela itatsi	Mammalia	[]	Carnivorous (small animals)	Rodents, frogs, small birds	Same, occasionally raids chicken coops, trash, etc.	Largely nocturnal	Native (e.g. Mustela itatsi).	Featured in folklore (sometimes conflated with other mustelids); cunning but less mythic fame than fox or tanuki	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
54	Squirrel	リス	Sciurus vulgaris or Sciurus lis	Mammalia	[]	Herbivore/omnivore	Nuts, seeds, fruits, buds	Ornamental garden seeds, bird feeders	Diurnal	Some species native (e.g. Sciurus lis), others introduced from North America or elsewhere.	Cute woodland image; less common in dense cities but present in suburban/forested areas	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
55	Thrush	ツグミ	Turdus eunomus	Birds	[{"path": "Animal/Thrush - Animal Picture.webp", "type": "animal", "original_name": "Thrush"}]	Omnivorous	Worms, insects, berries	Same, plus scraps in some cases	Diurnal, winter visitor in many areas	Native (migratory from northern Asia).	Common winter migratory bird; sign of changing seasons	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
56	Japanese Pygmy Woodpecker	コゲラ	Yungipicus kizuki	Birds	[{"path": "Animal/Japanese Pygmy Woodpecker - Animal Picture.webp", "type": "animal", "original_name": "Japanese Pygmy Woodpecker"}]	Insectivorous	Insect larvae under tree bark	In residential zones with trees, hunts insects in bark	Diurnal	Native.	Smallest woodpecker in Japan; known for drumming on trees	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
57	Cabbage Butterfly	モンシロチョウ	Pieris rapae	Insecta	[{"path": "Animal/Cabbage Butterfly - Animal Picture.webp", "type": "animal", "original_name": "Cabbage Butterfly"}, {"path": "Animal/Cabbage Butterfly_Casulo.webp", "type": "other", "original_name": "Cabbage Butterfly"}]	phytophagous in the larval stage and nectar/sap-feeding as adults	Larvae: Wild crucifers (e.g., Cardamine species).\nAdults: Nectar from wildflowers like dandelions, clovers, and asters in farmland or meadow-like areas.	Larvae: Garden vegetables (especially cabbage, kale, broccoli) or ornamental mustards.\nAdults: Nectar from ornamental garden flowers (marigolds, pansies, petunias) and any roadside flowers.	Diurnal.Typically most active on sunny late mornings to early afternoons. They can start flying soon after sunrise if warm enough, but peak activity often mid-late morning (10 AM–2 PM) in mild weather. Typically spring to autumn (around March–November), with multiple broods. They are quite common in warmer months; can be seen fluttering in sunny weather.	Native or possibly widespread in Eurasia; effectively native to East Asia.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
58	Japanese Swallowtail	アゲハチョウ	Papilio xuthus	Insecta	[{"path": "Animal/Japanese Swallowtail - Animal Picture.webp", "type": "animal", "original_name": "Japanese Swallowtail"}, {"path": "Animal/Japanese Swallowtail - Natural Habitat Picture.webp", "type": "habitat", "original_name": "Japanese Swallowtail"}]	phytophagous in the larval stage and nectar/sap-feeding as adults	Larvae: Native rutaceous plants (e.g., Japanese pepper tree, wild citrus).\nAdults: Nectar from wild azaleas, honeysuckles, milkweed, thistles.	Larvae: Garden citrus trees (yuzu, mikan, lemon) or ornamental rutaceous shrubs.\nAdults: Nectar from common urban flowers (petunias, lantana, zinnias, etc.). They may also sip from wet pavement or puddles (puddling behavior).	Strictly daytime. They thrive in bright sunlight, often seen mid-morning to mid-afternoon. On hot days, activity might spread out but they sometimes seek shade or water in the hottest hours.\nUsually April–October, peaking in mid-summer. In warmer regions, there can be multiple generations.	Native species in Japan (e.g. Papilio xuthus).	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
59	Great Purple Emperor	オオムラサキ	Sasakia charonda	Insecta	[{"path": "Animal/Great Purple Emperor - Animal Picture.webp", "type": "animal", "original_name": "Great Purple Emperor"}]	phytophagous in the larval stage and nectar/sap-feeding as adults	Larvae: Wild hackberry in woodland edges.\nAdults: Sap flows on oak, hackberry, or other broadleaf trees; also overripe fruit in forest zones.	Larvae: Could use ornamental hackberry if present (rare in typical city gardens).	Daytime. Generally more active during late morning through early afternoon. They are known to bask on tree trunks or feed on sap in well-lit forest edges. May retreat in lower light or cooler conditions. National butterfly of Japan, although not as common in densely urban areas. In Japan: Roughly June–August for the adult stage. Larvae overwinter on host plants and pupate in late spring.	Native, Japan’s national butterfly.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
60	Common Bluebottle	アオスジアゲハ	Graphium sarpedon	Insecta	[{"path": "Animal/Common Bluebottle - Animal Picture.webp", "type": "animal", "original_name": "Common Bluebottle"}]	phytophagous in the larval stage and nectar/sap-feeding as adults	Larvae: Camphor trees in forested or park areas, plus other Lauraceae species.\nAdults: Nectar from wild blossoms (e.g., azalea, honeysuckle), sometimes puddling near moist ground.	Larvae: May feed on ornamental camphor trees in parks or large private gardens.\nAdults: Urban flowers like lantana, petunias, or any bloom with accessible nectar. Often seen fluttering quickly in bright sun.	Daytime. They tend to be fast fliers and quite visible in late morning to early afternoon under sunny skies. They may rest if clouds roll in or if temperatures drop significantly. In Japan: Typically April–October, with peaks in warmer months. Very conspicuous in mid to late summer.	Native to East/Southeast Asia (including Japan).	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
61	Painted Lady	ヒメアカタテハ	Vanessa cardui	Insecta	[{"path": "Animal/Painted Lady - Animal Picture.webp", "type": "animal", "original_name": "Painted Lady"}]	phytophagous in the larval stage and nectar/sap-feeding as adults	Larvae: Thistles, nettles, other wild compounds in fields or roadsides.\nAdults: Wildflowers in open habitats, meadows, edges of farmland	Larvae: May use ornamental asters, daisies, or related species. They can sometimes be found on weedy patches in vacant lots.\nAdults: Any readily available nectar source in gardens, balcony planters, or public flowerbeds.	Daytime. Painted Ladies are strong fliers often seen most actively from late morning to mid-afternoon on sunny days. They can migrate, so activity sometimes extends to unusual times if conditions favor movement. In Japan: Often April–November, with migratory or multiple-brood patterns. Some years they appear in large numbers if conditions are favorable.	Widely distributed globally; in Japan, considered native or long-established migrant.	\N	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
62	Red Dragonfly	アキアカネ	Sympetrum frequens	Insecta	[{"path": "Animal/Red Dragonfly - Animal Picture.webp", "type": "animal", "original_name": "Red Dragonfly"}]	Predatory (other insects)	Larvae in water, adults catch insects	Same, but in rice fields or ponds near urban areas	Daytime. Generally becomes active after the morning warms up (late morning) and continues flying throughout early afternoon.\nOften seen perching in sunny spots or hovering over fields, especially in the late summer to autumn season.\nActivity may slow by late afternoon; they sometimes roost or perch in groups as evening approaches. Late summer–autumn	Native.	Cultural icon of autumn; often in haiku and seasonal references	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
63	Japanese Giant Dragonfly	オニヤンマ	Anotogaster sieboldii	Insecta	[{"path": "Animal/Japanese Giant Dragonfly - Animal Picture.webp", "type": "animal", "original_name": "Japanese Giant Dragonfly"}]	Predatory	Aquatic larvae eat tadpoles/insects, adults catch insects	Occasional in suburban gardens with water sources	Strictly daytime. Known to be most active in mid- to late morning through mid-afternoon when temperatures are higher.\nCommonly patrols along forest streams or river edges, hunting for insects in flight.\nMay rest on branches or tree trunks if it’s very hot or if cloud cover temporarily reduces sunlight.\nSummer	Native.	Largest dragonfly in Japan, symbol of agility and summer	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
64	Skimmers	シオカラトンボ or あじあいととんぼ	Orthetrum	Insecta	[{"path": "Animal/Skimmers - Animal Picture.webp", "type": "animal", "original_name": "Skimmers"}]	Predatory	aquatic larvae, airborne insect prey	Same, near standing water or damp gardens	Day-active. Typically noticeable in late morning once the sun is out and the air has warmed.\nActive in the early to mid-afternoon, perching on stones or twigs near ponds, ditches, and rice paddies.\nAs with most dragonflies, activity decreases in late afternoon, and they roost at dusk. Summer–early autumn	Native.	Known as "Kachi-mushi" (Victory Bug) because it only moves forward and never retreats. Samurai used the Tonbo motif on their armor and weapons to symbolize courage and focus.\n\nThe Ajisai Connection: During June in Tokyo, the Ajisai flowers hold water in their petals after the rain. This attracts mosquitoes and midges, which in turn attracts the Tonbo.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
65	Eurasian Skylark	ヒバリ	Alauda arvensis	Birds	[]	Omnivorous	Seeds, grains, and small insects (beetles, spiders, larvae).	Grass seeds in parks, leftover grains in suburban gardens or riverbanks (like the Tama River).	Year-round, but most famous in Spring (Feb–May) when they sing high in the sky.	Native to Japan.	Known as the "Messenger of Spring." In Japan, it is celebrated for its vertical flight and beautiful song, symbolizing high spirits and the rising sun.	\N	\N	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.395723+00	\N
66	Non-biting midge	ユスリカ	Chironomus yoshimatsui	Insecta	[{"path": "Animal/Non-biting midge - Animal Picture.webp", "type": "animal", "original_name": "Non-biting midge"}]	Herbivorous/detritivorous (larval stage); adult does not feed.	Decomposing organic matter, algae, aquatic microorganisms (larvae)	Similar to natural water sources, such as water tanks, artificial ponds, ditches, etc.	March to October (adults); in summer they appear in large groups at dusk.	Native of Japan	They appear in poems and literature as a summer presence, ephemeral.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
67	Drain Fly / Moth Fly	チョウバエ	Psychodidae (família), espécies comuns incluem Clogmia albipunctata	Insecta	[]	Larvae are saprophagous, while adults do not feed or only drink liquids.	Decomposing organic matter (in water or drains), biofilm, algae	Organic debris accumulated in drains, vases, trays, tanks	April to October (peak in summer), but can persist in humid environments. Nocturnal or crepuscular, attracted to light and humid environments.	Probably cosmopolitan, widely distributed worldwide.	Viewed as a nuisance insect, associated with a lack of cleanliness; common in urban pest control campaigns during the Japanese summer.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.395723+00	\N
68	Stink Bug	カメムシ	Halyomorpha halys (Brown Marmorated) or Nezara viridula (Green)	Insecta	[]	Herbivorous (Sap-sucking)	Tree sap, seeds, and wild berries from forests (Cedar, Cypress).	1. Home Gardens\nIf you grow vegetables on your veranda (a very common Tokyo hobby), you are essentially running a 5-star restaurant for them.\nLegumes (The Favorite): Edamame (soybeans) are their absolute favorite. They suck the juices directly from the developing beans inside the pods, causing them to shrivel.\nSolanaceous Vegetables: They love the juicy stems and fruits of tomatoes, eggplants, and green peppers (Piman/Shishito).\nCucurbits: They will target cucumbers and goya (bitter melon), which are popular "green curtains" used in Tokyo to keep apartments cool in summer.\n\n2. Residential Yards\nMany older houses in residential areas have fruit trees that have been there for decades.\nPersimmons (Kaki): A staple of Tokyo autumn. Kamemushi love the ripening fruit.\nCitrus: They frequent Yuzu, Mikan (satsuma oranges), and Lemon trees, which are very common in small Japanese front yards.\nLoquat (Biwa): These trees are everywhere in Tokyo, and the soft fruit in early summer is a major attractant.\n\n3. Public Greenery & Parks\nStreet Trees: They feed on the seeds and sap of the Keyaki (Japanese Zelkova—the official tree of Tokyo), Sakura (Cherry blossoms), and Icho (Ginkgo) trees.\nOrnamental Flowers: In public planters or shrines, they feed on Hydrangeas (Ajisai), Morning Glories (Asagao), and Roses.\nUrban Weeds: They aren't picky. They will feed on Yomogi (Mugwort) and various grasses found along train tracks (like the Chuo Line or Yamanote embankments) and vacant lots.	April to November \n\n(Peak "invasion" is October/November).Time of Day State Behavior in Tokyo Gardens/Apartments\nMorning (Sunrise - 10:00):  Basking | They move to the sunniest spots (South-facing walls or the tops of leaves) to warm up their bodies. In Tokyo, you’ll often see them stuck to the concrete of apartment buildings during this time.\nDaytime (10:00 - 16:00): Peak Activity | This is when they are most mobile. They fly between plants to feed on sap and search for mates. They are very alert and will drop to the ground if they feel the vibration of you approaching.\nDusk (17:00 - 19:00): Transition |  As the sun sets, they look for "heat islands." In the city, this means they fly toward the artificial lights of your windows or the warmth radiating from your balcony door.\nNighttime: Dormant | They are largely inactive at night. They tuck themselves into crevices, under leaves, or inside the folds of your laundry if it was left out late. They do not "sleep" like mammals, but their metabolism slows down significantly.	Native to Japan and East Asia.	In Tokyo, the Kamemushi is less of a "pest" in the dangerous sense and more of a seasonal nuisance that everyone loves to hate.\n\nThe Laundry Menace: There is a specific urban anxiety in Japan about these bugs. They are attracted to white surfaces and heat, making freshly washed white shirts and towels prime targets. If you accidentally fold one into your clothes and crush it, the smell (often compared to rotten cilantro or burnt rubber) is notoriously difficult to wash out.\n\nThe "Winter Herald": In Japanese folklore/common talk, a high population of Kamemushi in autumn is said to predict a heavy snowy winter. While not scientifically proven, it’s a staple conversation starter among neighbors in late October.\n\nThe "Hekisanki": In some dialects, they are called Hekisanki or Herizao. No matter the name, the reaction is the same: don't touch it with your bare hands.	\N	https://www.itakon.com/blog/tyaokmms	\N	\N	During summer its common to find their eggs in white cloth being dried at the sun! I tried to raise some I found in my pajamas, but they perished... I wasn't aware the eggs could be so fragile! There are many websites, forum posts and blogs that comment about this issue, with many people trying to understand white are these round thingies attached to their clothes and asking what should they do with them. Most people vacuum they apparently.	2026-02-12 13:56:17.395723+00	\N
\.


--
-- Data for Name: flora_angiosperm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flora_angiosperm (id, popular_name_en, popular_name_jp, scientific_name, classification, description, images, lifecycle, cultivated_when, months_foliage, months_flowers, months_fruits, edible_fruit, fruit_eaten, other_eaten, what_eaten, when_harvested, origin, garden_type, cultural_info, habitat, links, book_references, comments, created_at, updated_at) FROM stdin;
1	Green Foxtail	エノコログサ	Setaria viridis	Angiosperms	Wild grass; weed	[{"path": "Flora/Setaria viridis - Reference Picture.webp", "type": "reference", "original_name": "Setaria viridis"}]	Annual	\N	April, May, June, July, August, September, October	June, July, August, September, October	August, September, October	\N	No	No	\N	\N	Temperate regions of the world, likely Eurasia.	Weed, Wild plant	Its shape is very unique. It has become an icon of late summer and fall. It is also called 「狗（犬）の尾の草」, translated as cat/dog tail because of its appearance. It can be used to play with cats. It is also widely known as ネコジャラシ（猫じゃらし）. Seen as a weed, doesn't have a significative ornamental value, but appears in literature and poetry as a landscape of the end of summer.	Many areas of the city. It is a plant that grows unruly on asphalt, green areas and gardens that are not regularly pruned.	Wikipedia: https://ja.wikipedia.org/wiki/%E3%82%A8%E3%83%8E%E3%82%B3%E3%83%AD%E3%82%B0%E3%82%B5\n\n\nOther info: https://identify.plantnet.org/pt/k-world-flora/species/Setaria%20viridis%20(L.)%20P.Beauv./data	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.334407+00	\N
2	Japanese Morning Glory	アサガオ	Ipomoea nil	Angiosperms	Ornamental annual vine.	[{"path": "Flora/Ipomoea nil - Reference Picture.webp", "type": "reference", "original_name": "Ipomoea nil"}]	Annual	April, May	May, June, July, August, September	June, July, August, September	July, August, September	No	No	No	\N	\N	Tropical and subtropical America.	Weed, Ornamental (trellis, fences, school projects)	Its seeds are used in making medicines for constipation (a very strong one). It was brought to Japan by China and it become very popular as an ornamental plant, being highly bread and genetically modified. It's an image of summer. Flowers open in the morning.	Gardens, Weed	Good article: https://weathernews.jp/s/topics/202407/310265/\n\nAsagao Festival in Iriya: https://www.asagao-maturi.com/\nFestival Facebook Page: https://www.facebook.com/asagaomatsuri/	NAGAI, Mika. OKAZAKI, Emiko. KAWAGUCHI, Yuko. TAKASHIMA, Naoko. 365 Tips for Enjoying Life in Japan. Nametsume Publishing Co., Ltd. 2020.	\N	2026-02-12 13:56:17.334407+00	\N
3	Fish mint; Fish leaf; Rainbow plant; Chameleon plant; Heart leaf; Fish wort; Chinese lizard tail	ドクダミ	Houttuynia cordata	Angiosperms	Perennial herb/weed (medicinal); Perennial (rhizomatous)	[{"path": "Flora/Houttuynia cordata - Flower Picture.webp", "type": "flower", "original_name": "Houttuynia cordata"}, {"path": "Flora/Houttuynia cordata - Leaf Picture.webp", "type": "leaf", "original_name": "Houttuynia cordata"}, {"path": "Flora/Houttuynia cordata - Reference Picture.webp", "type": "reference", "original_name": "Houttuynia cordata"}, {"path": "Flora/Houttuynia cordata - Roots Picture.webp", "type": "roots", "original_name": "Houttuynia cordata"}]	Perennial	\N	April, May, June, July, August, September	May, June, July	June, July, August	No	\N	Yes	Leaves	May, June	China, Japan and Southeast Asia.	Weed	Widely used as a medicinal plant. It has anti-inflammatory and anti-oxidant properties. It is used as a tea, after drying the leaves, or as an insect repellent (macerate the flowers). The word “doku” means poison in Japanese, but that has nothing to do with the name of the plant. Because of its name, some people think it's poisonous, but that's not true. It can be rejected because it is a plant that grows widely everywhere and even after it has been cut down, it continues to grow. Inverno (novembro–fevereiro):\nA parte aérea desaparece quase por completo, mas o rizoma permanece viável no solo, pronto para rebrotar na primavera seguinte.	Many areas of the city. It is a plant that grows unruly on asphalt, green areas and gardens that are not regularly pruned. Its also abundant in green areas.	Making lotion from flowers in Satoyama: https://santome-community.com/dokudami-toner/\n\nGeneral overview: https://www.pharm.kumamoto-u.ac.jp/yakusodb/detail/003405.php\n\nFresh perspective of Dokudami: https://japanesegardens.jp/2016/07/09/weed-is-subjective-dokudami-in-japan/\n\nGreat article: https://gogo.wildmind.jp/feed/howto/270\n\nWays to cook Dokudami: https://otokonakamura.com/dokudami/	\N	\N	2026-02-12 13:56:17.334407+00	\N
4	Japanese Camellia	ツバキ	Camellia japonica	Angiosperms	Arbusto/arvoreta. Nova brotação de folhas ocorre geralmente na primavera (abril–maio).	[{"path": "Flora/Camellia japonica - Leaf Picture.webp", "type": "leaf", "original_name": "Camellia japonica"}, {"path": "Flora/Camellia japonica - Reference Picture.webp", "type": "reference", "original_name": "Camellia japonica"}, {"path": "Flora/Camellia japonica - Roots Picture.webp", "type": "roots", "original_name": "Camellia japonica"}]	Perennial	March, April, September, October	Evergreen	December, January, February, March	April, May, June, July, August, September, October, November	\N	\N	\N	\N	\N	Native to Japan, Korea, and China.	Urban landscape, domestic, paisagism, fences	Flowering occurs from late winter to early spring (depending on cultivation). Its fruits are woody capsules containing oil-rich seeds (used to produce Camellia oil). Tsubaki oil is used for hair care, cosmetics, and light cooking. It is not an edible fruit for table use. This flower is symbolic of late winter and appears in traditional arts, tea ceremonies, etc. In some places, there is a superstition against offering it to the elderly because the bloom drops off intact, which is associated with decapitation.	Urban landscaping for condominiums, institutions, and home gardens.	Japan Camellia Association: https://japancamellia.org/\n\nCamellias and Japanese Art: https://intojapanwaraku.com/rock/art-rock/2299/\n\nCamellias in Ishikawa! (Enjoying the beauty, Camellia festival and Camellia goods!): https://greensnap.jp/greenBlog/13187243	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.334407+00	\N
5	Japanese maple	モミジ	Acer palmatum	Angiosperms	Decídua. Perene de longo ciclo, mas perde as folhas anualmente.	[{"path": "Flora/Acer palmatum - Leaf Picture.webp", "type": "leaf", "original_name": "Acer palmatum"}, {"path": "Flora/Acer palmatum - Reference Picture.webp", "type": "reference", "original_name": "Acer palmatum"}, {"path": "Flora/Acer palmatum - Roots Picture.webp", "type": "roots", "original_name": "Acer palmatum"}]	Perennial	\N	March, April, May, June, July, August, September, October, November, December	April, May	May, June, July, August, September, October	No	No	Yes	Leaves	March, April, May	Native to Japan.	Tradicional e amplamente usado em paisagismo urbano e doméstico.	Seus frutos são Sâmara (semente alada não comestível). Folhas jovens podem ser fritas em tempurá (momiji tempurá — não comum em tóquio). É um grande símbolo do outono japonês; contemplação da coloração vermelha (momijigari).	Urban landscaping, public parks, temple gardens, and home gardens with ornamental purposes.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
13	Japanese plum / Japanese apricot	うめ	Prunus mume	Angiosperms	Árvore decídua	[{"path": "Flora/Prunus mume - Reference Picture.webp", "type": "reference", "original_name": "Prunus mume"}]	Perennial	November, December, January, February, March	March, April, May, June, July, August, September, October	February, March	April, May, June	Yes	Yes	\N	\N	\N	China, introduced to Japan centuries ago.	Árvore ornamental e frutífera.	Floração do inverno até início da primavera (janeiro-fevereiro). Seu fruto é comestível, mas crua é muito ácida e pode ser tóxica. É muito usado para umeboshi e licor umeshu. Sua flor é muito admirada, simboliza perseverança no frio. Usada em artes tradicionais e poemas desde o período Heian.	Orchards, parks, historical gardens, and botanical gardens with traditional fruit trees.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
6	Pansy	パンジー	Viola × wittrockiana	Angiosperms	Herbácea	[{"path": "Flora/Viola × wittrockiana - Leaf Picture.webp", "type": "leaf", "original_name": "Viola × wittrockiana"}, {"path": "Flora/Viola × wittrockiana - Reference Picture.webp", "type": "reference", "original_name": "Viola × wittrockiana"}, {"path": "Flora/Viola × wittrockiana - Roots Picture.webp", "type": "roots", "original_name": "Viola × wittrockiana"}]	Annual	September, October	October, November, December, January, February, March, April, May	November, December, January, February, March, April, May	\N	\N	\N	Yes	Flower	November, December, January, February, March, April, May	Hybrid originating from Europe.	Flores.	É anual, mas pode ser bi anual. Em lugares frios dura mais tempo. Sua floração acontece principalmente outono/primavera. São planta das no outono para florir no inverno-primavera). Seus frutos São cápsulas pequenas não comestíveis. Não é usada para comer habitualmente, mas algumas pétalas podem ser usadas como guarnição, mas não é tradição japonesa. É amplamente usada em canteiros de inverno/primavera; popularizada via floriculturas no Japão. What is eaten?: Petals in some Western-style salads, rare in Japan.	Gardens, parks, balconies, and urban flower beds for seasonal decoration.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
7	Summer Ivy	ナツツタ（夏蔦)	Parthenocissus tricuspidata	Angiosperms	Trepadeira lenhosa perene (decídua).	[{"path": "Flora/Parthenocissus tricuspidata - Leaf Picture.webp", "type": "leaf", "original_name": "Parthenocissus tricuspidata"}, {"path": "Flora/Parthenocissus tricuspidata - Reference Picture.webp", "type": "reference", "original_name": "Parthenocissus tricuspidata"}, {"path": "Flora/Parthenocissus tricuspidata - Roots Picture.webp", "type": "roots", "original_name": "Parthenocissus tricuspidata"}]	Perennial	\N	March, April, May, June, July, August, September, October, November	May, June	August, September, October	No	No	No	\N	\N	East Asia (Japan, China, and Korea).	Trepadeira	Usada para cobrir muros e fachadas; famosa pela coloração avermelhada no outono.	Walls, fences, building facades, and urban structures where it climbs and spreads rapidly.	https://satusyoku-diary.blog.ss-blog.jp/2019-12-08	\N	\N	2026-02-12 13:56:17.334407+00	\N
8	Persimmon	カキ（柿）	Diospyros kaki	Angiosperms	Perene de longo ciclo, folhas caem no outono.	[{"path": "Flora/Diospyros kaki - Flower Picture.webp", "type": "flower", "original_name": "Diospyros kaki"}, {"path": "Flora/Diospyros kaki - Leaf Picture.webp", "type": "leaf", "original_name": "Diospyros kaki"}, {"path": "Flora/Diospyros kaki - Reference Picture.webp", "type": "reference", "original_name": "Diospyros kaki"}, {"path": "Flora/Diospyros kaki - Roots Picture.webp", "type": "roots", "original_name": "Diospyros kaki"}]	Perennial	\N	April, May, June, July, August, September, October, November	May, June	June, July, August, September, October, November	Yes	Yes	Yes	Leaves	\N	East Asia (China and Japan)	Árvore	Amplamente consumido in natura, seco (hoshikaki), em doces, etc. um dos frutos de outono mais tradicionais do Japão, aparece em provérbios, literatura e na culinária sazonal. Frutos prontos no outono. Após a colheita (outubro–início de novembro), a árvore perde as folhas, podendo ficar com frutos pendurados (imagem típica do outono japonês). Leaves can be used occasionally for tea  (kakiyō-cha), but not very common.	Orchards, home gardens, roadside markets, and urban parks with fruit-bearing trees.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
9	Leek	ネギ	Allium fistulosum	Angiosperms	Perennial (but usually grown as a biennial or annual).	[{"path": "Flora/Allium fistulosum - Flower Picture.webp", "type": "flower", "original_name": "Allium fistulosum"}, {"path": "Flora/Allium fistulosum - Leaf Picture.webp", "type": "leaf", "original_name": "Allium fistulosum"}, {"path": "Flora/Allium fistulosum - Reference Picture.webp", "type": "reference", "original_name": "Allium fistulosum"}, {"path": "Flora/Allium fistulosum - Roots Picture.webp", "type": "roots", "original_name": "Allium fistulosum"}]	Perennial	January, February, March, April, May, June, July, August, September, October, November, December	April, May, June, July, August	June, July	July	\N	\N	Yes	Leaves	Evergreen	East Asia.	Vegetable garden or balcony planters.	In summer, it forms an umbel of flowers if left to grow. Essential in Japanese cuisine (soups, side dishes, etc.), it is one of the basic vegetables in Japanese cooking; grown in small gardens. In home gardens, it can be planted at almost any time; it regrows if left in the soil.	Vegetable gardens, urban farms, rooftop gardens, and community gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
10	Mikan	みかん	Citrus unshiu	Angiosperms	Árvore frutífera, folhagem sempre verde. Folhas renovam-se gradualmente na primavera e verão.	[{"path": "Flora/Citrus unshiu - Reference Picture.webp", "type": "reference", "original_name": "Citrus unshiu"}]	Perennial	\N	Evergreen	May	June, July, August, September, October, November, December, January	Yes	Yes	No	\N	October, November, December	Native to Japan or surrounding areas in Asia. Cultivated for a long time.	Árvore frutífera	Muito comum no inverno (símbolo de kotatsu e convivência familiar). Presente em festividades de fim de ano.	Orchards, home gardens, street trees in suburban areas, and public parks.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
11	Cherry Blossom	さくら	Prunus serrulata	Angiosperms	Árvore decídua	[]	Perennial	\N	March, April, May, June, July, August, September, October, November	March, April	May, June	Yes	No	Yes	Flower, Leaves	March, April, May	Japan and East Asia.	Árvore ornamental	Produz cerejas pequenas, não comercializadas. As pétalas/salgadas (Sakurazuke) e folhas (sakura mochi) São usadas em doces, mas a fruta é quase irrelevante. Símbolo nacional de transitoriedade da vida. Hanami (apreciação das flores) é um dos eventos mais importantes do calendário social.	Parks, streets, riverbanks, and large urban green spaces during spring festivals.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
12	Hydrangea	アジサイ	Hydrangea macrophylla	Angiosperms	Evergreen shrub (leaves may fall in cold regions).	[{"path": "Flora/Hydrangea macrophylla - Reference Picture.webp", "type": "reference", "original_name": "Hydrangea macrophylla"}]	Perennial	\N	March, April, May, June, August, September, October	June, July	August	\N	\N	No	\N	\N	East Asia, Japan is a center of diversity.	Flowering shrub.	Flowering occurs in late spring, during the rainy season. The fruits are small, inedible capsules. It is a major symbol of the rainy season; hydrangea festivals are very common, and it is often found in temples and parks.	Parks, residential gardens, roadside plantings, and shaded urban areas.	\N	\N	As the sun sets, the Ajisai leaves release moisture. In a Tokyo garden, this creates a "pocket" of cool, humid air. This is why you’ll see dragonflies and other insects congregating around them right as the day ends—it's the most comfortable spot in the garden during a heatwave.	2026-02-12 13:56:17.334407+00	\N
14	Lotus	ハス	Nelumbo nucifera	Angiosperms	Aquatic rhizomatous	[{"path": "Flora/Nelumbo nucifera - Reference Picture.webp", "type": "reference", "original_name": "Nelumbo nucifera"}]	Perennial	April, May	May, June, July, August, September, October	June, July, August	July, August	Yes	No	Yes	Roots	July, August	Tropical and subtropical Asia.	Aquatic	Its seeds are edible in some cultures, but not in Japan; its rhizome (renkon) is widely consumed in Japan. It is strongly associated with Buddhism.	Ponds, lakes, temple gardens, botanical gardens, and water features in urban parks.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
15	Water Lily	スイレン	Nymphaea spp.	Angiosperms	Aquatic (tubers or rhizomes). Floating flowers that open in the morning and close in the afternoon, for a few days.	[{"path": "Flora/Nymphaea spp. - Reference Picture.webp", "type": "reference", "original_name": "Nymphaea spp."}]	Perennial	April, May, June	April, May, June, July, August, September, October	May, June, July, August	August	\N	\N	No	\N	\N	Various native species and hybrids from different parts of the world.	Ornamental use in ponds, tanks and vases.	Less symbolic than the lotus in Buddhism, but popular in water gardens.	Ponds, artificial lakes, botanical gardens, and decorative water gardens in public spaces.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
16	Chrysanthemum	キク	Chrysanthemum morifolium	Angiosperms	Perennial herbaceous plant (often treated as an annual in floriculture)	[{"path": "Flora/Chrysanthemum morifolium - Reference Picture.webp", "type": "reference", "original_name": "Chrysanthemum morifolium"}]	Perennial	April, May, June	March, April, May, June, July, August	September, October, November	November, December	\N	\N	No	\N	\N	East Asia.	Ornamental plant, vases, Ikebana, widely sold and cultivated.	Chrysanthemums are the symbolic flower of the imperial family; they are celebrated at festivals, used as autumn decorations, and are highly revered. Exhibition: Chrysanthemum festivals take place between October and early November.	Parks, botanical gardens, cultural event spaces, and seasonal flower exhibitions.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
17	Japanese silver grass	ススキ	Miscanthus sinensis	Angiosperms	Rhizomatous grass with continuous growth.	[{"path": "Flora/Miscanthus sinensis - Reference Picture.webp", "type": "reference", "original_name": "Miscanthus sinensis"}]	Perennial	March, April, September, October	April, May, June, July, August	August, September, October	October, November	\N	\N	No	\N	\N	East Asia.	Ornamental grass in landscaping, or wild roadsides	Fruit: Common in Tsukimi (moon gazing) arrangements in September. Peak: In September, producing a silvery appearance that sways in the wind.	Fields, roadside verges, riverbanks, and large open green areas in rural and urban settings.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
18	Sweet osmanthus	キンモクセイ	Osmanthus fragrans var. aurantiacus	Angiosperms	Evergreen tree/shrub	[{"path": "Flora/Osmanthus fragrans var. aurantiacus - Reference Picture.webp", "type": "reference", "original_name": "Osmanthus fragrans var. aurantiacus"}]	Perennial	March, April, May, September, October	Evergreen	September, October	\N	\N	\N	No	\N	\N	China (southeastern and central regions), also found in parts of East Asia. It was introduced to Japan, where it became a very popular ornamental tree due to the fragrance of its flowers.	\N	\N	Parks, urban gardens, public squares, and institutional landscaping for fragrant displays.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
19	Moso bamboo	モウソウチク	Phyllostachys edulis	Angiosperms	Perene, mas as folhas podem cair e renovar-se gradualmente.	[]	Perennial	March, April, May, September, October	April, May	\N	\N	\N	\N	Yes	Roots	April, May	China\nLater it spread to Japan, where it is extensively cultivated for harvesting shoots (takenoko) and for the use of bamboo wood.	Tradicional, doméstico, ornamental	Consumo: Principal parte consumida são os brotos jovens (takenoko) na primavera.　O uso da madeira para utensílios e construção também é relevante.	Bamboo groves, parks, botanical gardens, temple grounds, and traditional gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
20	sasanqua camellia	サザンカ	Camellia sasanqua	Angiosperms	Arbusto	[{"path": "Flora/Camellia sasanqua - Reference Picture.webp", "type": "reference", "original_name": "Camellia sasanqua"}]	Perennial	March, April, May, September, October	Evergreen	October, November, December, January	\N	\N	\N	No	\N	\N	Japan (endemic or native to the archipelago), possibly extending to neighboring regions in East Asia.\nWidely cultivated in Japanese gardens.	Arbustos, ornamental, paisagismo urbano	\N	Urban landscaping, home gardens, public parks, and institutional flowerbeds.	\N	\N	O óleo das sementes pode ser usado de forma semelhante ao da Camellia japonica.	2026-02-12 13:56:17.334407+00	\N
21	tulip	チューリップ	Tulipa gesneriana	Angiosperms	Flor ornamental	[{"path": "Flora/Tulipa gesneriana - Reference Picture.webp", "type": "reference", "original_name": "Tulipa gesneriana"}]	Annual	October, November	February, March	April, May, June	\N	\N	\N	No	\N	\N	Mountainous areas of Central Asia (former Persian Empire, region of present-day Turkmenistan, Kazakhstan, etc.).	\N	\N	Public parks, ornamental gardens, urban flower beds, and seasonal floral displays.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
22	Rose	バラ	Rosa × hybrida	Angiosperms	Evergreen or semi-deciduous shrub. New leaf buds in spring (March–April). Bare-root: in winter (December–February).\nIn a pot: spring (March–May) or autumn (September–October).	[{"path": "Flora/Rosa × hybrida - Reference Picture.webp", "type": "reference", "original_name": "Rosa × hybrida"}]	Perennial	December, January, February, March, April, May, September, October	Evergreen	April, May, June, October, November	June, July, August, September, October, November	Yes	No	No	\N	\N	The genus Rosa is native to the Northern Hemisphere (Asia, Europe, North America, and parts of North Africa).\n\nMany hybrid roses used today have ancestry primarily from Asian and European species.	\N	Some organic rose petals can be used to decorate desserts or teas, but it is not a traditionally widespread practice in Japan for Rosa × hybrida.\nCultural / Ornamental:\nRoses are very popular in parks, home gardens, and flower shows. There are specific festivals in various regions (e.g., “Bara Matsuri” in municipal parks).\nAssociated with romance and elegance in contemporary Japanese culture (Western influence).	Gardens, ornamental parks, urban flower markets, and private home landscaping.	People and roses: https://kakogawa.keizai.biz/headline/916/\n\nIntersting blog about a person's experience in growing roses: https://note.com/yukaikayukako/n/ndbf871fa06cf	\N	\N	2026-02-12 13:56:17.334407+00	\N
23	Cactus	サボテン	Cactaceae	Angiosperms	Cactos são suculentas, sem “folhas” no sentido tradicional (são espinhos ou estruturas modificadas).	[{"path": "Flora/Cactaceae - Reference Picture.webp", "type": "reference", "original_name": "Cactaceae"}]	Perennial	April, May, June, July	Evergreen	March, April	\N	\N	\N	No	\N	\N	American continent (of the Americas), from southern Canada to Patagonia, with greater diversity in arid regions of Mexico.\nIntroduced to Japan as an ornamental or collectible plant.	\N	\N	Arid regions, urban gardens with low-water landscaping, indoor pots, and rooftop gardens.	Blog about cactus and succulents: https://ameblo.jp/kotablo2012/entry-12701156974.html	\N	\N	2026-02-12 13:56:17.334407+00	\N
24	Water hyacinth	ホテイアオイ	Eichhornia crassipes	Angiosperms	A floating aquatic plant, perennial in tropical climates. In Japan: It dies with frost, so it is treated as an annual in cold regions. Each flower may only last a few days, but flowering can last for weeks in warm weather.	[{"path": "Flora/Eichhornia crassipes - Reference Picture.jpg.crdownload.webp", "type": "reference", "original_name": "Eichhornia crassipes"}]	Annual	May, June, July	June, July, August, September, October, May	June, July, August	\N	\N	\N	No	\N	\N	South America (particularly the Amazon basin).\nIt has become invasive in many parts of the world, including Japan, when released into natural environments.	\N	Considered an invasive plant, it is released into nature.	Ponds, rivers, wetlands, and large water bodies in both urban and rural environments.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
25	Japanese sweet potato	サツマイモ	Ipomoea batatas	Angiosperms	\N	[{"path": "Flora/Ipomoea batatas - Reference Picture.webp", "type": "reference", "original_name": "Ipomoea batatas"}]	Annual	May, June	June, July, August	July, August	\N	\N	\N	Yes	Roots	September, October	Central and South America (tropical region, possibly northern South America or Central America).\nIt arrived in Asia via maritime routes and was widely cultivated in Japan (especially in Kagoshima, former Satsuma Prefecture).	\N	\N	Farms, vegetable gardens, rooftop gardens, school gardens, and home vegetable plots.	\N	\N	Planting: Seedlings (branches) in spring (May).\nGrowth: Large, vigorous leaves in summer (June–August). Flowers are rare in Japan; if they do occur, it is usually in summer (flowers similar to those of Ipomoea).	2026-02-12 13:56:17.334407+00	\N
26	Japanese Azalea	ツツジ	Rhododendron pulchrum	Angiosperms	Arbusto perene ou semidecíduo (dependendo da espécie). Folhas se renovam na primavera.	[{"path": "Flora/Rhododendron pulchrum - Reference Picture.webp", "type": "reference", "original_name": "Rhododendron pulchrum"}]	Perennial	March, April, May, September, October	Evergreen	April, May	\N	\N	\N	No	\N	\N	Many species of Rhododendron (azaleas) are native to East Asia (including parts of China, Japan, Korea, and Taiwan).\nIn Japan, several species and varieties are native, forming the basis of ornamental azaleas.	\N	\N	Parks, home gardens, suburban landscapes, and ornamental plantings around public buildings.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
27	Satsuki Azalea	サツキ	Rhododendron indicum	Angiosperms	Arbusto perene. Folhas novas na primavera, semelhantes às azaleias.	[{"path": "Flora/Rhododendron indicum - Reference Picture.webp", "type": "reference", "original_name": "Rhododendron indicum"}]	Perennial	March, April, May, September, October	Evergreen	May, June	\N	\N	\N	No	\N	\N	Japan (considered native or endemic to regions in the southern part of the archipelago).\nWidely used in bonsai and traditional gardens.	\N	Muito usada em bonsai e em jardins tradicionais.	Parks, residential gardens, temple grounds, and ornamental landscapes in urban areas.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
28	Japanese Wisteria	フジ	Wisteria floribunda	Angiosperms	Trepadeira	[{"path": "Flora/Wisteria floribunda - Reference Picture.webp", "type": "reference", "original_name": "Wisteria floribunda"}]	Perennial	February, March, October, November	March, April, May, June, July, August, September, October, November	April, May	May, June	No	\N	No	\N	\N	Japan (native species, while other Wisteria species are native to China or North America).\nFamous for its flower clusters on pergolas and spring festivals.	\N	Festivais: Ashikaga Flower Park (abril/maio).	Parks, gardens, pergolas, public squares, and traditional courtyards with trellises.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
29	Heavenly Bamboo	ナンテン	Nandina domestica	Angiosperms	Arbusto perene (folhas podem avermelhar no frio). Renovação: Folhas jovens na primavera (abril–maio), muitas vezes esverdeando depois.	[{"path": "Flora/Nandina domestica - Reference Picture.webp", "type": "reference", "original_name": "Nandina domestica"}]	Perennial	March, April, May, September, October	Evergreen	May, June	July, August, September, October, November	No	No	No	\N	\N	East Asia, encompassing China and Japan (also Korea on a smaller scale).\nNaturalized and widely cultivated in gardens as an ornamental "good luck" plant.	\N	A Nandina domestica é amplamente cultivada em jardins por suas folhas que mudam de cor (do verde ao vermelho) e pelos cachos de bagas vermelhas no outono-inverno.	Urban landscaping, public parks, residential gardens, and small green spaces near homes.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
30	Japanese Iris	ハナショウブ	Iris ensata	Angiosperms	Ornamental aquatic/bog flower. Perennial herb (rhizomatous). Rhizomes often planted/divided in spring (Mar–Apr) or autumn (Sep–Oct)	[{"path": "Flora/Iris ensata - Reference Picture.webp", "type": "reference", "original_name": "Iris ensata"}]	Perennial	March, April, September, October	April, May, June, July, August, September, October	June, July	July, August	No	No	\N	\N	\N	East Asia (Japan).	Ornamental (often near water features)	Celebrated in early-summer iris festivals (e.g., at shrines/parks)	Wetlands, water gardens, botanical gardens, and decorative ponds in public spaces.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
31	Plantain lily	ギボウシ	Hosta spp.	Angiosperms	Ornamental shade plant. Perennial herb.	[{"path": "Flora/Hosta spp. - Reference Picture.webp", "type": "reference", "original_name": "Hosta spp."}]	Perennial	March, April, September	April, May, June, July, August, September, October	June, July, August	August, September	No	No	\N	\N	\N	East Asia (Japan, China, Korea).	Ornamental (shade borders)	Popular for foliage in traditional/modern gardens; valued aesthetic plant	Gardens, shady urban parks, botanical gardens, and landscaping under tree canopies.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
32	Mondo grass	リュウノヒゲ	Ophiopogon japonicus	Angiosperms	Groundcover/ornamental.	[{"path": "Flora/Ophiopogon japonicus - Reference Picture.webp", "type": "reference", "original_name": "Ophiopogon japonicus"}]	Perennial	Year round	Evergreen	June, July	August, September, October	No	No	No	\N	\N	East Asia (Japan, China).	Ornamental groundcover/border in Japanese gardens	Common in temple gardens, rock gardens, pathways	Gardens, parks, green roofs, and urban landscaping for ground cover in shaded areas.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
33	Gardenia	クチナシ	Gardenia jasminoides	Angiosperms	Ornamental shrub	[{"path": "Flora/Gardenia jasminoides - Reference Picture.webp", "type": "reference", "original_name": "Gardenia jasminoides"}]	Perennial	March, April, May, September, October	Evergreen	May, June, July	August, September, October	\N	\N	\N	\N	September, October	Asia (China/Japan).	Ornamental shrub for fragrance	Common in home gardens for lovely scent; fruit used historically as yellow dye	Gardens, parks, private yards, and urban areas with ornamental shrub plantings.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
34	Tomato	トマト	Solanum lycopersicum	Angiosperms	Vegetable (fruit-vegetable)	[{"path": "Flora/Solanum lycopersicum - Reference Picture.webp", "type": "reference", "original_name": "Solanum lycopersicum"}]	Annual	April, May	May, June, July, August, September	June, July, August	June, July, August, September	Yes	Yes	No	\N	\N	South/Central America.	Kitchen/vegetable garden (balcony pots too)	Very popular; staple summer vegetable in modern Japanese cuisine	Vegetable gardens, urban farms, home gardens, and rooftop vegetable plots.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
35	Cucumber	キュウリ	Cucumis sativus	Angiosperms	Vegetable (fruit-vegetable). Foliage (vigorous vines).	[{"path": "Flora/Cucumis sativus - Reference Picture.webp", "type": "reference", "original_name": "Cucumis sativus"}]	Annual	April, May	May, June, July, August	June, July, August	June, July, August	Yes	Yes	No	\N	\N	South Asia.	Vegetable garden	Classic summer veggie, used in salads, pickles. Very eaten as street food and summer festivals.	Vegetable gardens, greenhouses, urban farms, and home gardening setups.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
36	Eggplant	ナス	Solanum melongena	Angiosperms	Vegetable (fruit-vegetable)	[{"path": "Flora/Solanum melongena - Reference Picture.webp", "type": "reference", "original_name": "Solanum melongena"}]	Annual	April, May	May, June, July, August, September, October	June, July, August, September	June, July, August, September	Yes	Yes	No	\N	\N	South/Southeast Asia (India).	Vegetable garden	Key summer veggie in Japanese cuisine (tempura, yakitori veg, simmered dishes)	Vegetable gardens, urban farms, community gardens, and agricultural fields.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
37	Daikon	ダイコン	Raphanus sativus var. longipinnatus	Angiosperms	Root vegetable.	[{"path": "Flora/Raphanus sativus var. longipinnatus - Reference Picture.webp", "type": "reference", "original_name": "Raphanus sativus var. longipinnatus"}]	Annual	August, September, March, April	September, October, November, December, April, May, June	April, May	June	\N	\N	Yes	Roots, Leaves	December, January, February, June, July, August	East Asia (domesticated in ancient times)	Vegetable garden	Staple in Japanese cooking (grated daikon oroshi, simmered oden, pickled takuan). Acho uma imagem forte do Japão. Vejo pessoas comprando Daikon sempre, as vezes levando numa mochilinha.	Vegetable gardens, rooftop farms, home gardens, and agricultural plots in urban areas.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
38	Paprika	シシトウ	Capsicum annuum	Angiosperms	Vegetable (pepper)	[{"path": "Flora/Capsicum annuum - Reference Picture.webp", "type": "reference", "original_name": "Capsicum annuum"}]	Annual	April, May	May, June, July, August, September, October	June, July, August, September	June, July, August, September, October	Yes	Yes	No	\N	\N	Derived from Capsicum (New World origin, adapted in Japan).	Vegetable garden	Common summer pepper, mild but occasionally spicy	Vegetable gardens, home gardens, urban farms, and greenhouse cultivation.	\N	\N	My chinese neighbour that owns a restaurant plant these a lot!	2026-02-12 13:56:17.334407+00	\N
39	Japanese Pumpkin	カボチャ	Cucurbita maxima	Angiosperms	Vegetable (fruit-vegetable). Foliage (large vines/leaves).	[{"path": "Flora/Cucurbita maxima - Reference Picture.webp", "type": "reference", "original_name": "Cucurbita maxima"}]	Annual	April, May	May, June, July, August, September	June, July, August	July, August, September, October	Yes	Yes	Yes	Seeds	August, September	From the Americas, introduced centuries ago.	Vegetable garden	Traditional autumn/winter staple (e.g., kabocha no nimono). I heard it came from Cambodia? But now I'm reading about the Americas... where did it come from?	Farms, home gardens, community agricultural projects, and local markets.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
40	Edamame	エダマメ	Glycine max	Angiosperms	Vegetable	[{"path": "Flora/Glycine max - Reference Picture.webp", "type": "reference", "original_name": "Glycine max"}]	Annual	May, June	June, July, August	June, July	July, August	Yes	Yes	Yes	Derived product	June, July	East Asia.	Vegetable garden	Popular summertime snack (boiled, salted) often served with beer. Derived product: Soy products, miso soup, shoyu, tofu.	Farms, community gardens, urban agriculture projects, and rooftop farms.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
41	Asian Pear	ナシ	Pyrus pyrifolia	Angiosperms	Fruit tree. Deciduous.	[{"path": "Flora/Pyrus pyrifolia - Reference Picture.webp", "type": "reference", "original_name": "Pyrus pyrifolia"}]	Perennial	November, December, January, February, March	April, May, June, July, August, September, October, November	April	August, September, October	Yes	Yes	No	\N	\N	East Asia (China/Japan)	Fruit orchard or larger home garden	Classic late-summer fruit in Japan; crisp, juicy	Orchards, urban home gardens, roadside markets, and suburban farms.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
42	Yuzu	ユズ	Citrus junos	Angiosperms	Citrus fruit	[{"path": "Flora/Citrus junos - Reference Picture.webp", "type": "reference", "original_name": "Citrus junos"}]	Perennial	March, April, May, September, October	Evergreen	May	November, December	Yes	Yes	\N	\N	\N	East Asia (likely hybrid from China/Tibet)	Fruit/citrus orchard or home garden	Essential for Japanese ponzu sauce, winter solstice yuzu bath tradition.\n\nO yuzu é resistente ao frio, o que contribui para seu cultivo em climas mais frios do Japão.	Orchards, home gardens, suburban landscapes, and traditional fruit farms.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
43	Sudachi	スダチ	Citrus sudachi	Angiosperms	Citrus fruit	[{"path": "Flora/Citrus sudachi - Reference Picture.webp", "type": "reference", "original_name": "Citrus sudachi"}]	Perennial	March, April, May, September, October	Evergreen	May	August, September, October	Yes	Yes	\N	\N	\N	Tokushima Prefecture, Japan?	Citrus orchard/home garden (milder climates)	Regional specialty in Shikoku, used in fish dishes, mushrooms (matsutake)	Orchards, public gardens, suburban home gardens, and roadside plantations.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
44	Kabosu	カボス	Citrus sphaerocarpa	Angiosperms	Citrus fruit	[{"path": "Flora/Citrus sphaerocarpa - Reference Picture.webp", "type": "reference", "original_name": "Citrus sphaerocarpa"}]	Perennial	March, April, May, September, October	Evergreen	May	August, September, October	Yes	Yes	\N	\N	\N	Oita Prefecture, Japan?	Citrus orchard/home garden (milder climates)	Regional specialty in Kyushu, similar usage to sudachi	Orchards, suburban farms, urban home gardens, and public park areas.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
45	Peach	モモ	Prunus persica	Angiosperms	Fruit tree. Deciduous.	[{"path": "Flora/Prunus persica - Reference Picture.webp", "type": "reference", "original_name": "Prunus persica"}]	Perennial	November, March	April, May, June, July, August, September, October	March, April	June, July, August	Yes	Yes	\N	\N	\N	China, cultivated in Japan for centuries	Fruit orchard or larger garden	Symbolic in folklore (Momotarō); prized summer fruit. Formato muito presente na cultura pop. Muito presente em designs famosos como o pêssego da caixa de fósforos e, consequentemente do artista Tanadoori.	Orchards, public parks, home gardens, and traditional agricultural areas.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
46	Perilla	シソ	Perilla frutescens	Angiosperms	Herb/leaf vegetable	[{"path": "Flora/Perilla frutescens - Reference Picture.webp", "type": "reference", "original_name": "Perilla frutescens"}]	Annual	April, May	May, June, July, August, September, October	August, September	September, October	\N	\N	Yes	Leaves, Seeds	May, June, July, August, September	East Asia.	Kitchen/herb garden	Essential garnish with sashimi, pickled with ume (red shiso). Seeds can be used for furikake. The leaf also has a beautiful shape and strong/particular taste/smell.	Farms, home gardens, rooftop gardens, and urban herb gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
47	Japanese parsley	ミツバ	Cryptotaenia japonica	Angiosperms	Leafy herb/vegetable	[{"path": "Flora/Cryptotaenia japonica - Reference Picture.webp", "type": "reference", "original_name": "Cryptotaenia japonica"}]	Perennial	March, April, May	April, May, June, July, August, September, October	June, July, August	September, October	No	No	Yes	Leaves	March, April, May, June, July, August, September, October	East Asia (Japan).	Herb/vegetable bed, shady areas	Common garnish in miso soup, chawanmushi, etc.	Farms, community gardens, urban agriculture spaces, and rooftop gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
48	Japanese Ginger	ミョウガ	Zingiber mioga	Angiosperms	Herb/spice. Perennial rhizome. Rhizomes planted in spring.	[{"path": "Flora/Zingiber mioga - Reference Picture.webp", "type": "reference", "original_name": "Zingiber mioga"}]	Perennial	March, April	May, June, July, August, September, October	July, August, September	\N	\N	\N	Yes	Flower	July, August, September	East Asia (Japan, China).	Shady herb patch, moist soil	Classic summer garnish for soba, miso, pickles. The young flower buds are eaten.	Farms, urban vegetable gardens, rooftop farms, and local wetlands.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
49	Java water dropwort	セリ	Oenanthe javanica	Angiosperms	Leafy herb/vegetable (aquatic). Perennial, but grown like an annual in moist soil.	[{"path": "Flora/Oenanthe javanica - Flower Picture.webp", "type": "flower", "original_name": "Oenanthe javanica"}, {"path": "Flora/Oenanthe javanica - Reference Picture.webp", "type": "reference", "original_name": "Oenanthe javanica"}]	Annual	April, May, June	April, May, June, July, August, September, October	July, August	August	No	No	Yes	Leaves, Stem	March, April, May, June, July, August	East/Southeast Asia.	Herb or water-edge garden	One of the seven spring herbs (nanakusa); traditional	Wetlands, riverbanks, ponds in public parks, and urban water treatment areas.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
50	Petunia	ペチュニア	Petunia spp.	Angiosperms	Ornamental annual flower. Treated as annual in Tokyo (perennial in warm tropics). Foliage may decline in extreme heat/humidity.	[{"path": "Flora/Petunia spp. - Reference Picture.webp", "type": "reference", "original_name": "Petunia spp."}]	Annual	April	April, May, June, July, August, September	April, May, June, July, August, September, October	August, September	No	No	No	\N	\N	Hybrid from South American species.	Ornamental bedding, containers	Very common for bright color in spring-summer flower beds	Gardens, public parks, urban green spaces, and seasonal flower exhibitions.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
51	Impatiens	インパチェンス	Impatiens spp.	Angiosperms	Ornamental shade flower. Treated as annual (some species are perennial in warmer climates).	[{"path": "Flora/Impatiens spp. - Reference Picture.webp", "type": "reference", "original_name": "Impatiens spp."}]	Annual	April, May	April, May, June, July, August, September, October	May, June, July, August, September, October	\N	No	No	No	\N	\N	Tropical/subtropical Asia or Africa (depending on species).	Ornamental, shade/partial shade flower	Popular for summer color in shady spots	Gardens, balconies, rooftop gardens, public parks, and ornamental displays.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
52	Marigold	マリーゴールド	Tagetes spp.	Angiosperms	Ornamental annual	[{"path": "Flora/Tagetes spp. - Reference Picture.webp", "type": "reference", "original_name": "Tagetes spp."}]	Annual	April, May	May, June, July, August, September, October	June, July, August, September, October	August, September	\N	\N	No	\N	\N	Americas (Mexico, Central America).	Ornamental bedding, sometimes near vegetables to repel nematodes	Common, easy-to-grow bedding flower	Gardens, public flower beds, community parks, and decorative urban landscapes.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
53	Persian Cyclamen	シクラメン	Cyclamen persicum	Angiosperms	Ornamental potted flower. Perennial tuber, but often treated as seasonal houseplant.	[{"path": "Flora/Cyclamen persicum - Reference Picture.webp", "type": "reference", "original_name": "Cyclamen persicum"}]	Perennial	September, October, November, December, January, February	September, October, November, December, January, February, March, April	November, December, January, February	\N	No	No	\N	\N	\N	Mediterranean region	Often indoor/greenhouse in Japan, or cool outdoor balconies in mild winters	Popular gift plant in winter, sold widely around year-end	Gardens, shaded urban parks, balconies, and indoor decorative pots.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
54	Japanese Anemone	シュウメイギク	Anemone hupehensis var. japonica	Angiosperms	Ornamental perennial herbaceous	[{"path": "Flora/Anemone hupehensis var. japonica - Reference Picture.webp", "type": "reference", "original_name": "Anemone hupehensis var. japonica"}]	Perennial	March, April, May, September, October	April, May, June, July, August, September, October, November	August, September, October	September, October, November	No	No	No	\N	\N	China/Japan area.	Ornamental borders, partial shade	Delicate autumn bloom, often in cottage-style or traditional gardens	Gardens, parks, shaded green areas, and botanical gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
55	Tea plant	チャ	Camellia sinensis	Angiosperms	Beverage plant (tea shrub)	[{"path": "Flora/Camellia sinensis - Reference Picture.webp", "type": "reference", "original_name": "Camellia sinensis"}]	Perennial	March, April, May, September, October	Evergreen	October, November, December	November, December, January	\N	No	Yes	Leaves, Seeds	March, April, May, June, July, August, September, October, November	East Asia (China)	Tea gardens or hobby orchard	Central to Japanese tea culture; grown in specialized farms, occasionally home gardens	Gardens, tea plantations, public parks, and traditional tea houses.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
56	Bitter melon	ゴーヤ	Momordica charantia	Angiosperms	Summer vegetable (fruit-vegetable). (trellised vines).	[{"path": "Flora/Momordica charantia - Reference Picture.webp", "type": "reference", "original_name": "Momordica charantia"}]	Annual	May	May, June, July, August, September	June, July, August	June, July, August, September	Yes	Yes	Yes	Leaves	June, July, August, September	South/Southeast Asia.	Vegetable garden or “green curtain” on balconies	Gaining popularity, especially as a "green curtain" for summer heat.\n\nOverripe fruits can be toxic, and excessive consumption can cause hypoglycemia.	Farms, community gardens, urban vegetable plots, and traditional markets.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
57	Japanese Artemisia	ヨモギ	Artemisia princeps	Angiosperms	Herb/wild plant	[{"path": "Flora/Artemisia princeps - Reference Picture.webp", "type": "reference", "original_name": "Artemisia princeps"}]	Perennial	N/A, March, April, May	March, April, May, June, July, August, September	August, September	September, October	No	No	Yes	Leaves	April, May	East Asia.	Sometimes grown in herb corners, but also a common wild plant	Leaves used in kusa mochi (mugwort mochi). Traditional in sweets, folk medicine.	Fields, meadows, green urban spaces, and roadside verges.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
58	Geranium	ゼラニウム	Pelargonium spp.	Angiosperms	Ornamental bedding/pot plant. Perennial in mild climates, often grown as annual or kept indoors in winter.	[{"path": "Flora/Pelargonium spp. - Reference Picture.webp", "type": "reference", "original_name": "Pelargonium spp."}]	Annual	April, May	April, May, June, July, August, September, October, November	April, May, June, July, August, September, October, November	\N	No	No	No	\N	\N	South Africa.	Ornamental pots, window boxes	Common bright ornamental, widely sold in garden centers	Gardens, balconies, community parks, and urban decorative landscapes.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
59	Begonia	ベゴニア	Begonia spp.	Angiosperms	Ornamental bedding/houseplant. Perennial in warm climates, grown as annual or indoor plant in Japan.	[{"path": "Flora/Begonia spp. - Reference Picture.webp", "type": "reference", "original_name": "Begonia spp."}]	Annual	April	April, May, June, July, August, September, October, November	March, April, May, June, July, August, September, October	\N	No	No	No	\N	\N	Tropics/subtropics (Americas, Asia, Africa) depending on species.	Ornamental bedding or houseplant	Very common for shade-tolerant summer color in pots/beds	Gardens, public spaces, green rooftops, and decorative flower beds.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
73	fig	イチジク	Ficus carica	Angiosperms	Fruit tree. Deciduous.	[{"path": "Flora/Ficus carica - Reference Picture.webp", "type": "reference", "original_name": "Ficus carica"}]	Perennial	March, November	April, May, June, July, August, September, October, November	\N	August, September, October	Yes	Yes	\N	\N	\N	Middle East/Western Asia	Fruit orchard, warm microclimate corners	Traditional in some regions; fresh figs can be pricey in stores	Orchards, home gardens, urban green areas, and public parks.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
60	Calibrachoa	カリブラコア	Calibrachoa spp.	Angiosperms	Ornamental annual (petunia-like). Treated as annual in Tokyo.	[{"path": "Flora/Calibrachoa spp. - Reference Picture.webp", "type": "reference", "original_name": "Calibrachoa spp."}]	Annual	April	April, May, June, July, August, September, October	April, May, June, July, August, September, October	August, September, October	No	No	No	\N	\N	South America.	Ornamental containers/hanging baskets	Popular “mini petunia,” decorative from spring to fall	Gardens, balconies, public parks, and flower exhibitions.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
61	Madagascar periwinkle	ニチニチソウ	Catharanthus roseus	Angiosperms	Ornamental bedding.  Perennial in tropics, annual in Tokyo’s climate.	[{"path": "Flora/Catharanthus roseus - Reference Picture.webp", "type": "reference", "original_name": "Catharanthus roseus"}]	Annual	May	May, June, July, August, September, October	June, July, August, September, October	\N	No	No	No	\N	\N	Madagascar.	Ornamental bedding/containers	Very common summer bedding flower, heat-tolerant.\n\nExtremely toxic if ingested.	Gardens, indoor pots, public flower beds, and balconies.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
62	gerbera daisy	ガーベラ	Gerbera jamesonii	Angiosperms	Ornamental cut-flower/houseplant. Perennial in mild climates, often grown as annual or potted plant.	[{"path": "Flora/Gerbera jamesonii - Reference Picture.webp", "type": "reference", "original_name": "Gerbera jamesonii"}]	Annual	April, May	April, May, June, July, August, September, October, November	April, May, June	\N	No	No	No	\N	\N	Africa	Ornamental container or cut-flower bed	Popular for bright daisy-like flowers, used in bouquets	Gardens, parks, flower markets, and decorative public spaces.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
63	Dahlia	ダリア	Dahlia spp.	Angiosperms	Ornamental tuberous flower. Perennial tuber, but often lifted or treated as annual if winter is harsh.	[{"path": "Flora/Dahlia spp. - Reference Picture.webp", "type": "reference", "original_name": "Dahlia spp."}]	Annual	April, May	May, June, July, August, September, October	July, August, September, October	\N	No	No	\N	\N	\N	Mexico/Central America.	Ornamental flower bed, showy blooms	Common in flower shows, large flamboyant blooms	Gardens, balconies, rooftop gardens, and seasonal public displays.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
64	Basil	バジル	Ocimum basilicum	Angiosperms	Culinary herbs. Annual in Tokyo (perennial in tropics).	[{"path": "Flora/Ocimum basilicum - Reference Picture.webp", "type": "reference", "original_name": "Ocimum basilicum"}]	Annual	May	May, June, July, August, September, October	July, August, September	August	No	No	Yes	Leaves	June, July, August	Tropical Asia/Africa.	Herb/kitchen garden, pots	Western herb gained huge popularity in Italian-inspired dishes	Herb gardens, balconies, rooftop gardens, and community herb patches.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
65	rosemary	ローズマリー	Salvia rosmarinus	Angiosperms	Culinary/ornamental herb. Shrub.	[{"path": "Flora/Salvia rosmarinus - Reference Picture.webp", "type": "reference", "original_name": "Salvia rosmarinus"}]	Perennial	April, May, September, October	Evergreen	March, April, May	\N	No	No	Yes	Leaves	Evergreen	Mediterranean region	Herb garden, ornamental border	Popular with Western cuisine, ornamental in modern Japanese gardens	Herb gardens, home gardens, public herb displays, and rooftop green spaces.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
66	Lavender	ラベンダー	Lavandula spp.	Angiosperms	Ornamental/aromatic herb. Subshrub.	[{"path": "Flora/Lavandula spp. - Reference Picture.webp", "type": "reference", "original_name": "Lavandula spp."}]	Perennial	March, April, May, September	Evergreen	June, July	August, September	No	No	Yes	Leaves	June, July	Mediterranean.	Herb/ornamental border	loved in Furano (Hokkaido); used in sachets, aroma products, some culinary novelt. Occasionally the flowers in teas, but mild use.  Some culinary use of dried flowers (Western style).	Herb gardens, balconies, rooftop gardens, and public parks with aromatic plants.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
67	Mint	ミント	Mentha spp.	Angiosperms	Culinary herb/medicinal. Perennial (rhizomatous), can be invasive.	[{"path": "Flora/Mentha spp. - Reference Picture.webp", "type": "reference", "original_name": "Mentha spp."}]	Perennial	March, April, May, September, October, November	April, May, June, July, August, September, October, November	June, July, August	\N	No	No	Yes	Leaves	June, July, August	Europe/Asia (various species).	Herb garden, often container	Common in drinks, desserts; caution about invasiveness	Herb gardens, home gardens, indoor pots, and urban green spaces.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
68	parsley	パセリ	Petroselinum crispum	Angiosperms	Culinary herb/garnish. Biennial, grown as annual in Tokyo.	[{"path": "Flora/Petroselinum crispum - Reference Picture.webp", "type": "reference", "original_name": "Petroselinum crispum"}]	Annual	March, April, May, September	March, April, May, June, July, August, September, October, November	\N	\N	No	No	Yes	Leaves	April, May, June, July, August, September, October, November	Mediterranean	Herb/vegetable garden, containers	Standard garnish in Western-style cooking, common in supermarkets	Herb gardens, balconies, public parks, and culinary gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
69	cilantro	パクチー	Coriandrum sativum	Angiosperms	Culinary herb	[{"path": "Flora/Coriandrum sativum - Reference Picture.webp", "type": "reference", "original_name": "Coriandrum sativum"}]	Annual	March, April	April, May, June	May, June	June, July	\N	\N	Yes	Seeds	June, July	Mediterranean/Middle East	Herb/vegetable bed, container	Recently popular with “ethnic” food trend (Thai, Vietnamese)	Herb gardens, community gardens, and urban agriculture spaces.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
70	Chili pepper	トウガラシ	Capsicum frutescens	Angiosperms	Vegetable/spice	[{"path": "Flora/Capsicum frutescens - Reference Picture.webp", "type": "reference", "original_name": "Capsicum frutescens"}]	Annual	April, May	May, June, July, August, September, October	June, July, August, September	July, August, September, October	Yes	Yes	No	\N	\N	Americas.	Vegetable/spice bed	Used in many Japanese dishes (togarashi spice mixes, shichimi)	Farms, home gardens, urban agriculture projects, and greenhouses.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
71	strawberry	イチゴ	Fragaria × ananassa	Angiosperms	Fruit/berry. Perennial, but grown as short-lived in Japan.	[{"path": "Flora/Fragaria × ananassa - Reference Picture.webp", "type": "reference", "original_name": "Fragaria × ananassa"}]	Annual	September, October, March, April	May, June, July, August, September	April, May	May, June	Yes	Yes	Yes	Leaves	\N	Hybrid from Europe/Americas	Fruit/vegetable patch, containers	Leaves occasionally for tea, but not common.	Farms, community gardens, rooftop farms, and home gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
72	blueberry	ブルーベリー	Vaccinium spp.	Angiosperms	Fruit shrub. Perennial deciduous or evergreen (depending on species).	[{"path": "Flora/Vaccinium spp. - Reference Picture.webp", "type": "reference", "original_name": "Vaccinium spp."}]	Perennial	March, April, September, October	April, May, June, July, August, September, October, November	April, May	June, July, August	Yes	Yes	No	\N	\N	North America (mainly)	Home orchard or container fruit	Increasingly popular for pick-your-own farms and home growing	Orchards, home gardens, botanical gardens, and public parks.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
74	lemon	レモン	Citrus limon	Angiosperms	Citrus fruit	[{"path": "Flora/Citrus limon - Reference Picture.webp", "type": "reference", "original_name": "Citrus limon"}]	Perennial	April, May, October, November	Evergreen	April, May	November, December, January	Yes	Yes	\N	\N	\N	Likely Northeast India region	Citrus orchard or container in sunny spot	ncreasingly popular for homemade recipes, fresh lemon usage	Orchards, public parks, botanical gardens, and suburban gardens.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
75	flowering dogwood	ハナミズキ	Cornus florida	Angiosperms	Ornamental flowering tree. Perennial deciduous.	[{"path": "Flora/Cornus florida - Reference Picture.webp", "type": "reference", "original_name": "Cornus florida"}]	Perennial	November, March	April, May, June, July, August, September, October, November	April, May	June, July, August, September, October	No	No	No	\N	\N	Eastern North America, introduced to Japan	Ornamental street/residential tree	Popular since early 20th century (gift exchange with US), spring blossom	Orchards, public parks, community gardens, and suburban farms.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
76	olive	オリーブ	Olea europaea	Angiosperms	Fruit tree (olive). Perennial evergreen.	[{"path": "Flora/Olea europaea - Reference Picture.webp", "type": "reference", "original_name": "Olea europaea"}]	Perennial	April, March, September, October	Evergreen	May, June	August, September, October, November	Yes	Yes	Yes	Derived product	\N	Mediterranean region	Ornamental/edible, sunny spot	Trendy in modern Japanese landscaping; Shodoshima famous for olive grove. Oil extracted, but home extraction is rare. Fruits must be processed (brined). Normally, people eat imported ones.	Gardens, public parks, roadside plantings, and urban squares.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
77	Bougainvillea	ブーゲンビリア	Bougainvillea spp.	Angiosperms	Ornamental tropical vine/shrub. Perennial in warm climates; in Tokyo, may need greenhouse in winter.	[{"path": "Flora/Bougainvillea spp. - Reference Picture.webp", "type": "reference", "original_name": "Bougainvillea spp."}]	Annual	April, May	April, May, June, July, August, September, October	May, June, July, August, September, October	\N	No	\N	No	\N	\N	South America.	Ornamental in warm areas or greenhouse containers	More common in southern Japan or indoors; prize for bright bracts.	Gardens, public parks, urban green corridors, and ornamental fences.	News about lady's Bougainvillea: https://sasatto.jp/article/entry-2050.html	\N	\N	2026-02-12 13:56:17.334407+00	\N
78	Oleander	キョウチクトウ	Nerium oleander	Angiosperms	Ornamental flowering shrub	[{"path": "Flora/Nerium oleander - Reference Picture.webp", "type": "reference", "original_name": "Nerium oleander"}]	Perennial	March, April, September, October	Evergreen	May, June, July, August, September, October	August, September, October	No	No	No	\N	\N	Mediterranean/subtropical Asia.	Ornamental for heat tolerance, roadsides	Seen in public landscaping; known toxicity but valued for showy flowers and drought resistance.\n\nExtremely toxic if ingested.	Paddy fields, agricultural research areas, traditional rice paddies, and rural landscapes.	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
79	Rice	イネ	Oryza sativa	Angiosperms	Cereal grain	[{"path": "Flora/Oryza sativa - Reference Picture.webp", "type": "reference", "original_name": "Oryza sativa"}]	Annual	May, June	May, June, July, August, September	July, August	August, September	Yes	Yes	Yes	Stem	September, October	Likely domesticated in China; in Japan for millennials.	Primarily paddy fields (not usual in home “gardens,” but sometimes small personal rice plots)	Staple food from Japan; central to traditional cuisine, culture (e.g., sake production, Shinto rituals), and identity.	Paddy fields, agricultural research areas, traditional rice paddies, and rural landscapes.	To grow rice in buckets! https://life.ja-group.jp/education/bucket/diary/saibai_diary/579/	\N	\N	2026-02-12 13:56:17.334407+00	\N
80	Common Dandelion / Western Dandelion	セイヨウタンポポ	Taraxacum officinale	Angiosperms	A hardy, rosette-forming herb with bright yellow composite flowers and hollow stalks containing milky sap.	[{"path": "Flora/Taraxacum officinale - Reference Picture.webp", "type": "reference", "original_name": "Taraxacum officinale"}]	Perennial	\N	Evergreen	March, April, May, June, July, August, September, October	November, October, September, August, July, June, May, April, March	No	No	Yes	Leaves, Flower, Roots	March, October	Europe (Naturalized in Japan).	Sidewalk cracks, neglected lawn edges, and urban waste ground.	Often viewed as an invasive weed that displaces the native Japanese species.\n\nCommon Name for Seeds        Watage (綿毛 - "Cotton hair/fluff")\nCore Activity: (Blowing the seeds) to watch them scatter.\nNostalgia Factor: It is considered a "quintessential childhood memory" (natsukashii). In the crowded neighborhoods of Tokyo, dandelions are often the first "interactive" nature children encounter on their walk to kindergarten.\nFortune Telling        Similar to Western traditions, children often make a wish while blowing. There is also a local superstition that if a seed enters your ear, it might grow there (a common "scary story" parents tell kids to keep them from putting things in their ears).\nArtistic Symbolism        The flying seeds represent departure or traveling to a new world. Because they fly away to start a new life, they are often used in Japanese graduation imagery or metaphors for moving away from home.\nDomestic Gardening View        While children love them, amateur gardeners in Tokyo have a love-hate relationship with the Watage. Because Tokyo gardens are so small, a single child blowing seeds in a neighboring yard can "infest" an entire row of perfectly manicured tsubo-niwa with dandelions for the next season.\nVisual Aesthetics        In Japanese aesthetics, the moment the seeds fly is seen as a form of Mujo (impermanence). It is a brief, beautiful moment where the solid flower head turns into a cloud and vanishes with a single breath.	Everywhere in urban Tokyo; it is the most common dandelion found in the city center.	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	What is eaten? Young leaves (salads), flowers (syrup/wine), and roots (roasted for tea).\n\nWhen is it harvested? Leaves in early Spring; roots in Autumn.\n\n\nDifferences between Native and European Dandellions: https://daa-tango.ssl-lolipop.jp/field_flower/tanpopo.html\n\nThe Biological "Dealbreaker": Sexual vs. Asexual\nThe difference lies in a process called Apomixis.\n\nThe Western Dandelion (Seiyō-tanpopo): It is triploid and performs apomixis. This means it can produce seeds without any pollination at all. It essentially clones itself. It doesn't need bees, it doesn't need another dandelion nearby, and it doesn't care if it's growing in a sterile concrete crack in Shinjuku. It is the ultimate urban generalist.\n\nThe Native Kanto Dandelion (Kantō-tanpopo): It is diploid and requires cross-pollination. It is "self-incompatible," meaning it cannot even pollinate itself. It needs:\n\nA partner: Another native dandelion nearby.\n\nA courier: Local pollinators (specifically native bees like the Nihon-mitsubachi or certain small beetles).\n\nWhy this matters:\n\nThe "Social" Plant: The native dandelion is a social organism. It requires a community (other plants) and a service (insects). If a Tokyo garden is isolated by high walls or has no insect life due to pesticides, the native dandelion will fail to reproduce and eventually disappear.\n\nThe "Isolationist" Plant: The Western dandelion is a loner. It can dominate a garden solo.\n\nHybridization: To make matters worse, the Western dandelion can sometimes provide pollen to the native one, creating hybrids. In many Tokyo "domestic gardens," what looks like a native dandelion is actually a hybrid that has lost its genetic "purity."	2026-02-12 13:56:17.334407+00	\N
81	Kanto Dandelion / Japanese Native Dandelion	カントウタンポポ	Taraxacum platycarpum	Angiosperms	A hardy, rosette-forming herb with bright yellow composite flowers and hollow stalks containing milky sap.\n\nVery similar to the Western variety, but distinguished by the bracts at the base of the flower head which point upward rather than curling down.	[{"path": "Flora/Taraxacum platycarpum - Reference Picture.webp", "type": "reference", "original_name": "Taraxacum platycarpum"}]	Perennial	\N	March, December, April, June, May, July, August, September, October, November	March, April, May	April, May, June	No	No	Yes	Leaves, Flower	March, February	Native to Japan (specifically the Kanto plain/Tokyo area).	Traditional Japanese gardens, temple grounds, and "Satoyama" conservation plots.	Highly valued as a symbol of "Old Tokyo" nature; protected by local enthusiasts.	Large parks like Shinjuku Gyoen or the Imperial Palace gardens; rarely in modern residential sidewalks.	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	Differences between Native and European Dandellions: https://daa-tango.ssl-lolipop.jp/field_flower/tanpopo.html\n\nThe Biological "Dealbreaker": Sexual vs. Asexual\nThe difference lies in a process called Apomixis.\n\nThe Western Dandelion (Seiyō-tanpopo): It is triploid and performs apomixis. This means it can produce seeds without any pollination at all. It essentially clones itself. It doesn't need bees, it doesn't need another dandelion nearby, and it doesn't care if it's growing in a sterile concrete crack in Shinjuku. It is the ultimate urban generalist.\n\nThe Native Kanto Dandelion (Kantō-tanpopo): It is diploid and requires cross-pollination. It is "self-incompatible," meaning it cannot even pollinate itself. It needs:\n\nA partner: Another native dandelion nearby.\n\nA courier: Local pollinators (specifically native bees like the Nihon-mitsubachi or certain small beetles).\n\nWhy this matters:\n\nThe "Social" Plant: The native dandelion is a social organism. It requires a community (other plants) and a service (insects). If a Tokyo garden is isolated by high walls or has no insect life due to pesticides, the native dandelion will fail to reproduce and eventually disappear.\n\nThe "Isolationist" Plant: The Western dandelion is a loner. It can dominate a garden solo.\n\nHybridization: To make matters worse, the Western dandelion can sometimes provide pollen to the native one, creating hybrids. In many Tokyo "domestic gardens," what looks like a native dandelion is actually a hybrid that has lost its genetic "purity."	2026-02-12 13:56:17.334407+00	\N
82	Japanese Thistle	ノアザミ	Cirsium japonicum	Angiosperms	An upright, prickly plant with deeply lobed, spiny leaves and vibrant purple/magenta thistle heads.	[{"path": "Flora/Cirsium japonicum - Reference Picture.webp", "type": "reference", "original_name": "Cirsium japonicum"}]	Perennial	March, April	March, April, May, June, July, August, September, October, November	May, June, August, July	June, July, August, September	No	\N	Yes	Roots, Stem	October, March, April	Japan	Wild gardens, meadow-style borders, or large rural-style residential plots.	A classic motif in Japanese art and Ikebana representing resilience and wild beauty.	Along river banks, suburban gardens.	\N	\N	What is eaten? Roots (known as Yamagobo) and young stems.\n\nWhen is it harvested? Roots in late Autumn; stems in Spring.\n\nThe flowers are in pamphlets of TAKAO 599 MUSEUM.	2026-02-12 13:56:17.334407+00	\N
83	Chocolate Vine / Five-leaf Akebia	アケビ	Akebia quinata	Angiosperms	A vigorous woody climber with delicate purple flowers and sausage-shaped purple fruits that split open when ripe.	[{"path": "Flora/Akebia quinata - Reference Picture.webp", "type": "reference", "original_name": "Akebia quinata"}]	Perennial	January, February, March	April, May, June, July, August, September, October, November, December	April, May	September, October	Yes	Yes	Yes	Leaves, Skin	September, October, March, April	Japan.	Trellises, pergolas, and fences in compact urban gardens.	Regarded as a "taste of Autumn" and a staple of mountain vegetable cuisine (sansai).\n\nIt represents "rural nostalgia." In the Tohoku region (Akita/Yamagata), it's a staple of autumn. In design, its "splitting open" is a symbol of maturity and harvest.	Growing over the entryways, pergolas or fences of older residential houses in Tokyo.	Family experience descovering Akebia in their garden: https://nonbiri.jp/%E3%82%B5%E3%83%84%E3%83%9E%E3%82%A4%E3%83%A2%E3%81%8B%E3%81%A8%E6%80%9D%E3%81%A3%E3%81%9F%E3%82%89%E3%83%BB%E3%83%BB%E3%83%BB%F0%9F%8D%A0%EF%BC%88%E4%BB%8B%E8%AD%B7%E4%BB%98%E3%81%8D%E3%83%9B/	\N	While Akebi grows wild throughout Japan, Yamagata Prefecture (neighboring Akita) is actually the top commercial producer, accounting for about 80% of Japan's market production. However, it is very popular across the entire Tohoku region (including Akita), where it is deeply rooted in local food culture and "mountain vegetable" (sansai) traditions.\n\nAkebi is a very "subtle" fruit compared to modern, highly-sweetened supermarket fruits.\n\nThe White Pulp (Internal):\n\nTexture: It is soft, gelatinous, and slightly slimy, similar to a dragon fruit or a very soft lychee, but filled with many small, crunchy black seeds.\n\nTaste: It has a mild, delicate sweetness. Some describe it as a mix between pear and coconut milk, but very faint.\n\nNote: Most people do not chew the seeds; they swallow them or spit them out.\n\nThe Purple Rind (External):\n\nTaste: The rind is bitter if eaten raw.\n\nTexture: It is thick and slightly chewy, similar to an eggplant or a bell pepper when cooked.\n\nPreparation: In regions like Akita, the rind is the "main event." It is often stuffed with minced meat and miso, then sautéed or deep-fried as tempura. The bitterness pairs perfectly with savory miso.	2026-02-12 13:56:17.334407+00	\N
84	Grape	ブドウ	Vitis vinifera (European types) or Vitis labrusca (American types like Kyoho)	Angiosperms	A vigorous, woody deciduous vine that climbs using tendrils. It has large, lobed leaves that provide excellent shade in summer.	[]	Perennial	January, February	April, May, June, July, August, September, October, November	May, June	August, September, October	Yes	Yes	Yes	Leaves	August, September, October	Mixed (European and North American origins; many popular Japanese cultivars were developed locally).	Small urban pergolas (pāgora), balconies, or "green curtains" over parking spaces.	Grapes symbolize the peak of late summer and early autumn. There is a strong culture of "perfect fruit" in Japan; even amateur gardeners in Tokyo will often put individual paper bags (fukuro-kake) over each cluster to protect them from insects and birds.\n\nSomething else eaten? Rarely in Japan (unlike Mediterranean cultures, Japanese cuisine doesn't typically use grape leaves for cooking/wrapping).\n\nKyoho (The King of Grapes): Large, purple-black, thick-skinned grapes. Traditionally, Japanese people peel the skin and spit out the seeds. This is the "classic" Tokyo garden grape.\n\nShine Muscat: A bright green, seedless variety where you eat the skin. This is the "modern" favorite. Many homeowners in Tokyo are now grafting or planting this variety because it is easier to eat and highly fashionable.\n\nBecause Tokyo summers are notoriously hot, grapes are functionally used in domestic design as climate control. Homeowners grow them specifically to shade south-facing windows, combining food production with sustainable architecture.	\N	\N	\N	\N	2026-02-12 13:56:17.334407+00	\N
\.


--
-- Data for Name: flora_bryophyte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flora_bryophyte (id, popular_name_en, popular_name_jp, scientific_name, classification, description, images, origin, garden_type, cultural_info, habitat, links, book_references, comments, created_at, updated_at) FROM stdin;
1	White Cushion Moss	シラガゴケ	Leucobryum glaucum	Bryophytes	\N	[{"path": "Flora/Leucobryum glaucum - Reference Picture.webp", "type": "reference", "original_name": "Leucobryum glaucum"}]	Many moss species are cosmopolitan; different species native worldwide, including Japan	Traditional Japanese, temple gardens, shaded rock gardens, bonsai accent	\N	\N	\N	\N	\N	2026-02-12 13:56:17.369337+00	\N
2	Haircap Moss	ハネゴケ	Polytrichum commune	Bryophytes	\N	[{"path": "Flora/Polytrichum commune - Gametophyte Picture.webp", "type": "gametophyte", "original_name": "Polytrichum commune"}, {"path": "Flora/Polytrichum commune - Reference Picture.webp", "type": "reference", "original_name": "Polytrichum commune"}]	Many moss species are cosmopolitan; different species native worldwide, including Japan	Traditional Japanese, temple gardens, shaded rock gardens, bonsai accent	\N	\N	\N	\N	\N	2026-02-12 13:56:17.369337+00	\N
3	\N	ハイゴケ	Hypnum plumaeforme	Bryophytes	\N	[{"path": "Flora/Hypnum plumaeforme - Gametophyte Picture.webp", "type": "gametophyte", "original_name": "Hypnum plumaeforme"}, {"path": "Flora/Hypnum plumaeforme - Habitat Picture.webp", "type": "habitat", "original_name": "Hypnum plumaeforme"}, {"path": "Flora/Hypnum plumaeforme - Reference Picture.webp", "type": "reference", "original_name": "Hypnum plumaeforme"}, {"path": "Flora/Hypnum plumaeforme - Sporophyte (Capsule) Picture.webp", "type": "sporophyte", "original_name": "Hypnum plumaeforme"}]	Many moss species are cosmopolitan; different species native worldwide, including Japan	Traditional Japanese, temple gardens, shaded rock gardens, bonsai accent	\N	\N	\N	\N	\N	2026-02-12 13:56:17.369337+00	\N
4	Broom Moss	スギゴケ	Dicranum scoparium	Bryophytes	\N	[{"path": "Flora/Dicranum scoparium - Reference Picture.webp", "type": "reference", "original_name": "Dicranum scoparium"}]	Many moss species are cosmopolitan; different species native worldwide, including Japan	Traditional Japanese, temple gardens, shaded rock gardens, bonsai accent	\N	\N	\N	\N	\N	2026-02-12 13:56:17.369337+00	\N
5	\N	ミズゴケ	Sphagnum	Bryophytes	\N	[{"path": "Flora/Sphagnum - Reference Picture.webp", "type": "reference", "original_name": "Sphagnum"}]	Many moss species are cosmopolitan; different species native worldwide, including Japan	Traditional Japanese, temple gardens, shaded rock gardens, bonsai accent	\N	\N	\N	\N	\N	2026-02-12 13:56:17.369337+00	\N
6	Liverworts	ゼニゴケ	Marchantia polymorpha	Bryophytes	\N	[{"path": "Flora/Marchantia polymorpha - Reference Picture.webp", "type": "reference", "original_name": "Marchantia polymorpha"}]	Many moss species are cosmopolitan; different species native worldwide, including Japan	Traditional Japanese, temple gardens, shaded rock gardens, bonsai accent	\N	\N	Very nice blog: https://tonysharks.com/Tree_of_life/Eukaryote/Plantae/Land_plants/Marchantia_polymorpha/Marchantia_polymorpha.html	\N	\N	2026-02-12 13:56:17.369337+00	\N
\.


--
-- Data for Name: flora_gimnosperma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flora_gimnosperma (id, popular_name_en, popular_name_jp, scientific_name, classification, description, images, lifecycle, months_foliage, months_flowers, months_fruits, origin, garden_type, cultural_info, habitat, links, book_references, comments, created_at, updated_at) FROM stdin;
1	Japanese Pine Tree	クロマツ	Pinus thunbergii	Gymnosperms	\N	[{"path": "Flora/Pinus thunbergii - Leaf Picture.webp", "type": "leaf", "original_name": "Pinus thunbergii"}, {"path": "Flora/Pinus thunbergii - Reference Picture.webp", "type": "reference", "original_name": "Pinus thunbergii"}, {"path": "Flora/Pinus thunbergii - Roots Picture.webp", "type": "roots", "original_name": "Pinus thunbergii"}]	Perennial	\N	\N	\N	Native to Japan and East Asia (coastal).	Traditional, domestic, long-lived tree.	\N	\N	\N	\N	\N	2026-02-12 13:56:17.359151+00	\N
2	Ginkgo	イチョウ	Ginkgo biloba	Gymnosperms	\N	[]	Perennial	\N	\N	\N	China (ancient)\nWidely in Japan	Large ornamental/street tree\n(temples, parks)	\N	\N	\N	\N	\N	2026-02-12 13:56:17.359151+00	\N
3	Japanese cedar	スギ	Cryptomeria japonica	Gymnosperms	\N	[]	Perennial	\N	\N	\N	Endemic to Japan	Large forest/ornamental tree	\N	\N	\N	\N	\N	2026-02-12 13:56:17.359151+00	\N
\.


--
-- Data for Name: flora_pteridophyte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flora_pteridophyte (id, popular_name_en, popular_name_jp, scientific_name, classification, description, images, lifecycle, months_foliage, origin, garden_type, cultural_info, habitat, links, book_references, comments, created_at, updated_at) FROM stdin;
1	Horsetail	スギナ	Equisetum arvense	Pteridophytes	\N	[{"path": "Flora/Equisetum arvense - Flower Picture.webp", "type": "flower", "original_name": "Equisetum arvense"}, {"path": "Flora/Equisetum arvense - Leaf Picture.webp", "type": "leaf", "original_name": "Equisetum arvense"}, {"path": "Flora/Equisetum arvense - Reference Picture.webp", "type": "reference", "original_name": "Equisetum arvense"}, {"path": "Flora/Equisetum arvense - Roots Picture.webp", "type": "roots", "original_name": "Equisetum arvense"}]	Perennial	\N	Widely distributed in the north hemisphere.	Weed	\N	Domestic gardens; Urban	\N	Ecosystem Conservation Society-Japan Foundation. Japanese Living-things Calendar. Tetsuji Maeda. 2009.	\N	2026-02-12 13:56:17.349681+00	\N
\.


--
-- Data for Name: garden_styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.garden_styles (id, popular_name_en, name_jp, characteristics, links, created_at, updated_at) FROM stdin;
1	English Cottage Garden	イングリッシュコテージガーデン	Visually “romantic” and densely planted, with many different flowers (roses, lavender, herbaceous plants).\n\nAdoption of low fences, small stone paths, and a profusion of colors.\n\nAttractive to those who want an informal and flowery garden, contrasting with the traditional minimalist aesthetic.\n\nIn small spaces, pots and vertical trellises are used to create the typical flower density of the “cottage.”\n\n---\n\nLike the enchanted land in a children’s book, cottage-style gardens are romantic escapes full of life and exuberance. They are an absolute contradiction to formal gardens and may seem a little out of hand, but with a few simple rules, you can craft them into the perfect natural retreat you’re looking for.\n\nCurved paths and abundant plant clusters are key features of a cottage garden. The soil should be able to support the number of plants; therefore, make sure to add compost annually. There are no rules for colors. Use your freedom to combine comforting pastels with intense reds and oranges to achieve a wholesome look.\n\nContrasting heights, small trees like hydrangea, and flowering plants like roses and peonies with multiple petals make the cottage style a success. Some props include a small fence or an iron gate that creates an enclosure. Painted wooden furniture or a vine-clad trellis will give you the cottage-style garden of your dreams.	https://www.setouchiminka.jp/nature/journal/howto-about-gardens.html	2026-02-12 13:56:17.420928+00	\N
2	French shabby garden	フレンチシャビーガーデン	The French shabby garden is a garden style that is all white but has rusty spots here and there, allowing you to enjoy the changes that occur over time without being too pretentious.\n\nA French shabby garden is best suited to a house with a white exterior. What's more, since it's the polar opposite of modern, a plastered exterior wall with an old-fashioned feel would look great in it.\n\nWhen creating a French shabby garden, the important thing is to use white colors for fences and walls, and rustic small items. You can also DIY by painting them white and intentionally creating a finish that looks like the paint has peeled off.\n\nFor the exterior, rusty iron, tin, and iron go great with it.	https://greensnap.jp/article/8488	2026-02-12 13:56:17.420928+00	\N
3	Junk Garden	ジャンクガーデン	The "junk" in junk garden refers to rubbish, and this garden style is attractive for its carefree look, as it is made up of a collection of miscellaneous tools and items that suit the individual's tastes.\n\nGardening in a junk garden goes well with a garage house. It goes well with exterior walls that have a rugged solid wood image or a matte navy blue to gray color.	\N	2026-02-12 13:56:17.420928+00	\N
4	French Formal Garden	フレンチガーデン / フランス式庭園	Strongly inspired by symmetry, geometry, and "patterned flowerbeds" (parterres).\n\nTopiary elements, neatly trimmed hedges, fountains, and classical statues.\n\nIt conveys an "elegant European" air, highly sought after in high-end condominiums or residences aiming for sophistication.\n\nReduced scale (smaller patios), replacement of large hedges with smaller versions of topiary or plants in trimmed pots.	\N	2026-02-12 13:56:17.420928+00	\N
5	Mediterranean / Spanish Style	地中海風ガーデン	Use of tiles, white walls (if possible), drought-tolerant plants (lavender, rosemary, olive trees).\n\nTerracotta elements, rustic vases, and warm colors (ochres, blues).\n\nIt evokes a "resort" or summer atmosphere, aesthetically light.\n\nIn warm regions of Japan (Shikoku, Kyushu), olive trees and lavender are relatively easy to maintain. In Tokyo, they are also popular on sunny balconies.	\N	2026-02-12 13:56:17.420928+00	\N
6	Bali / Tropical Resort Style	バリ風 / リゾート風ガーデン	Tropical "spa" ambiance: use of dark stones, wooden elements, Balinese statues, tropical plants (palms, ornamental banana trees), if the climate permits.\n\nIt may have a small fountain or mini stone pool.\n\nPeople seek an "escape" from the urban rush, creating a relaxing atmosphere. Hotels and ryokans adopt this style.\n\nIn colder regions, certain tropical plants do not thrive outdoors; therefore, indoor alternatives or "ornamental versions" that withstand moderate cold are used.	\N	2026-02-12 13:56:17.420928+00	\N
7	Tropical-Style Garden	\N	Why fly to a faraway island when you can enjoy a tropical vacation right in the backyard of your home? Tropical-style gardens with their exotic plants and vivacious foliage make for luxurious escapes in sultry settings. Although they thrive best in warmer temperatures, in colder regions, these gardens can stand out in a short growing season with lush growth.\n\nPlants in tropical-style gardens survive on moisture. Hence, the trick is to complement the lavish greens with a water feature in the design. A fountain, swimming pool, garden pond, or water garden can add the missing tropical glow.\n\nPlay with varying foliage and colors to create an organic look. Layered planting, raised beds, and bright blooms work well in these gardens. Opt for taller plants like tree ferns or palms together with low-lying plant species like Phormium tenax and vibrant flowering kinds like trumpet vines for best results. Accentuate this equatorial getaway with a hammock under the canopy and tiki statues. Don’t forget to add lights for the relaxing evening hours.	\N	2026-02-12 13:56:17.420928+00	\N
8	Desert / Succulent Gardens	サボテン＆多肉植物ガーデン	Focus on cacti, succulents, and pebbles; often with "desert-style" design containers.\n\nMinimalist or "cool" look, using white stones and geometric pots.\n\nLow maintenance and modern aesthetics, they combine well with small balconies.\n\nIn humid locations (Japanese summer), drainage needs attention. They are generally kept in pots to avoid waterlogging.\n\n---\n\nDesert landscapes are from the typical notion of a drab and dreary scenery. If you're looking for a low-maintenance alternative, then desert-style gardens are a perfect choice. With its dramatic plants, this style looks like a setup for a movie. These succulents perform well in sunny locations with well-drained soil. Owing to their water-storing capacity, these plant species can also survive drought.\n\nOther than the traditional additions like cacti and yucca, experiment with taller varieties like acacia for shade and colored species like a begonia. Layer small and large plants with different textures to achieve more depth. Big rocks can add a sculptural dimension to the desert-style garden, but remember to control the number and size for a balanced composition.\n\nEstablish a flow of movement with serpentine paths and curved bed lines. Container plants work well in this landscape style. Another trick is to replace grass with gravel for ground cover. Gravel will not only form a unifying plant bed but also allow better rainwater percolation into the soil.	https://gharpedia.com/blog/garden-landscape-styles/	2026-02-12 13:56:17.420928+00	\N
9	Modern / Minimal Contemporary	モダンスタイルの庭	Straight lines, clean layout, emphasis on materials such as concrete, metal, and glass.\n\nSelected plants with striking foliage (dwarf bamboos, ornamental grasses).\n\nContemporary house architecture integrates minimalist gardens that dialogue with clean interiors.\n\nTypically, few plant species are used, but with arrangements that enhance the limited space.	\N	2026-02-12 13:56:17.420928+00	\N
10	North European Cottage / Scandinavian Style	北欧風ガーデン	A blend of simplicity with rustic comfort.\nUse of light wood furniture, details in pastel shades, wildflowers but not as dense as in an English cottage.\n\nThe "hygge"/"lagom" trend (comfort, coziness) has won admirers in Japan.\n\nIn colder climates, it is relatively easy to maintain "temperate climate" plants, but snow requires some protection.	\N	2026-02-12 13:56:17.420928+00	\N
11	Tsubo-niwa: “Courtyard Garden” or “Small Patio Garden”	坪庭 (Tsubo-niwa)	Compact space—often a few square meters in a house’s interior courtyard or between structures.\nEmphasis on moss, stones, a few carefully chosen plants (bamboo, small maples).\nCreates a viewing space from inside, offering a sense of nature even in tight urban plots.\nSubdued elements (stepping stones, water basin, minimal ornamentation) evoke calm.	\N	2026-02-12 13:56:17.420928+00	\N
12	“Dry Rock Garden” or “Zen Garden”	枯山水 (Karesansui)	Use of gravel or sand raked into patterns to represent water, with rocks symbolizing islands or mountains.\nTypically little to no water or large plants; a few pruned shrubs or moss patches might appear.\nEncourages meditative viewing—the arrangement of stone and empty space highlights a spiritual aesthetic.\nIn small home gardens, sometimes done as a mini karesansui corner, offering a “Zen accent.”	\N	2026-02-12 13:56:17.420928+00	\N
13	“Wabi-Sabi Garden” / “Natural Style Garden”	侘び寂び (Wabi-sabi) or 自然風 (Shizen-fū)	Celebrates rustic simplicity, imperfection, and transience.\nUse of weathered materials (old stones, bamboo fences), moss, asymmetrical layouts.\nPlants chosen for subtle beauty (ferns, low shrubs, possibly a small maple or camellia).\nEncourages a quiet, aged, humble atmosphere, consistent with the notion of wabi-sabi.	\N	2026-02-12 13:56:17.420928+00	\N
14	“Hill-and-Pond Garden” (in miniature)	築山式 (Tsukiyama-shiki)	Traditionally a large-scale style with artificial hills, a pond, and winding paths.\nIn domestic Kanto gardens, it’s scaled down—perhaps a small mound, a stone “stream,” and a tiny water feature.\nAttempts to miniaturize natural landscapes (mountain-lake scenery) within limited space.\nMay include stepping stones, a small bridge, or a stone lantern.	\N	2026-02-12 13:56:17.420928+00	\N
15	“Modern Japanese-style Garden”	和風モダン庭 (Wafū modan niwa)	Blends traditional Japanese elements (stone lantern, bamboo screen, gravel patches) with contemporary materials (concrete, metal, minimalist lines).\nOften used in newer suburban homes or stylish city residences.\nFewer plants, clean lines, small water features or accent boulders.\nPrioritizes a harmonious fusion of old and new, suitable for limited urban yards.	\N	2026-02-12 13:56:17.420928+00	\N
16	Provence style	プロヴァンススタイル	The Provence region of France, facing the Mediterranean Sea, has a culture of valuing beauty over time. Picturesque gardens with a resort-like scent are gaining popularity along with the homes they are built in. Antique-style exteriors that harmonize with beautiful flowers and trees create a wonderful garden. https://mukustyle-garden.jp/gardenstyle/	\N	2026-02-12 13:56:17.420928+00	\N
\.


--
-- Data for Name: objects_and_other; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.objects_and_other (id, popular_name_en, name_jp, images, purpose_original, purpose_other, links, created_at, updated_at) FROM stdin;
1	Hibachi Pot	火鉢	[{"path": "Object/Hibachi Pot_Other Uses.webp", "type": "other_use", "original_name": "Hibachi Pot"}, {"path": "Object/Hibachi Pot_Reference Picture.webp", "type": "reference", "original_name": "Hibachi Pot"}, {"path": "Object/Hibachi Pot_Uso Original.webp", "type": "original_use", "original_name": "Hibachi Pot"}]	To heat the house. To grill food.	To grow plants. To grow water plants (very common). To keep fish (I see it many houses! Sometimes they attach a filter to the pot). Decoration.	Personal Statement: https://www.suginamigaku.org/2014/10/tool-hibachi.html	2026-02-12 13:56:17.409842+00	\N
2	Clothes rail	物干し竿	[{"path": "Object/Varal_Jardim.webp", "type": "garden", "original_name": "Varal"}, {"path": "Object/Varal_Uso Original.webp", "type": "original_use", "original_name": "Varal"}]	To hang clothes and other fabric items.	To hang and dry kaki fruit	Hoshigaki: https://life-with-photo.com/hoshigaki\nHoshigaki 2: https://blog.goo.ne.jp/fujika_0000/e/ea96603cc4b39ae2454ad42e0c3828c6	2026-02-12 13:56:17.409842+00	\N
3	Plastic Water Bottle	猫よけ　（ペットボトル）	[{"path": "Object/Plastic Water Bottle - Original Use Picture.webp", "type": "original_use", "original_name": "Plastic Water Bottle"}, {"path": "Object/Plastic Water Bottle - Other Uses Picture.webp", "type": "other_use", "original_name": "Plastic Water Bottle"}]	To keep drinkable water.	To keep stray cats and dogs away. Cutting off the bottom and placing it over a young seedling to trap warmth in cooler weather.	Blog article (really good): http://pictist.sblo.jp/article/188370381.html\n\n\nRant video of plastic bottles in Japan: https://www.youtube.com/watch?v=mDiCWq8rQj0&t=673s	2026-02-12 13:56:17.409842+00	\N
4	Stone	石（イシ）	[{"path": "Object/Stone - Reference Picture.webp", "type": "reference", "original_name": "Stone"}]	A mineral that simply exists in the land.	Balances the energy of the household (ancient beliefs). Is involved in the aesthetic principles of the Japanese Garden: in dry garden the stones may represent the landscape. In gardens with water it may be well used in the construction itself of the course of the water. It may also be worshiped in megalithic approaches. Zen Rock Arrangements: Representing mountains or islands in karesansui (dry gardens).\nSmall Spirit Stones: Placed near mini-shrines or Jizō statues to mark sacred spaces.	\N	2026-02-12 13:56:17.409842+00	\N
5	Pot	植木鉢 (ueki-bachi) ・ 鉢 (hachi)	[{"path": "Object/Pot - Reference Picture.webp", "type": "reference", "original_name": "Pot"}]	Container for growing plants.	Abandoned garbage.	\N	2026-02-12 13:56:17.409842+00	\N
6	External Air-conditioner machine	エアコンの室外機 (eakon no shitsugai-ki)	[{"path": "Object/External Air-conditioner machine - Reference Picture.webp", "type": "reference", "original_name": "External Air-conditioner machine"}]	\N	Camouflage with Bamboo Screen: Common practice is to place a small bamboo fence around it, enhancing the traditional garden feel.\nPot Shelf on Top: Some homeowners set lightweight planters on a simple frame above the unit for vertical usage of limited space.	\N	2026-02-12 13:56:17.409842+00	\N
7	Bricks	レンガ (renga)	[{"path": "Object/Bricks - Reference Picture.webp", "type": "reference", "original_name": "Bricks"}]	To build something or create a step.	\N	\N	2026-02-12 13:56:17.409842+00	\N
8	Anti-animal gadgets - Sound Machine	動物撃退グッズ (dōbutsu gekitai guzzu)・害獣対策グッズ (gaijū taisaku guzzu)	[{"path": "Object/Anti-animal gadgets - Sound Machine - Reference Picture.webp", "type": "reference", "original_name": "Anti-animal gadgets - Sound Machine"}]	Wind Chime-likes: Some repellents (like reflective tape) also create a whimsical effect in the sun. There are also many high toned sound machines.	The hign tone sound machines are very irritating for pedestrians too.	\N	2026-02-12 13:56:17.409842+00	\N
9	Vinyl Sheets	ビニール シート	[{"path": "Object/Vinyl Sheets - Reference Picture.webp", "type": "reference", "original_name": "Vinyl Sheets"}]	To cover items. Sometimes used attached to the soil to kill weeds.	\N	\N	2026-02-12 13:56:17.409842+00	\N
10	Bird Repellent CD	鳥よけCD	[{"path": "Object/Bird Repellent CD - Reference Picture.webp", "type": "reference", "original_name": "Bird Repellent CD"}]	Similar purpose to other repellents. It's said it can also scare cats.	It's funny to see what was the CD's original content. Many of them come from instruction manuals. When I was looking for a quick way to buy a CD it was quite hard to find one in general stores.	Amazing post about someone that wrote about the experience with this phenomenon: https://dailyportalz.jp/kiji/111121150808	2026-02-12 13:56:17.409842+00	\N
11	Plant support for Trees	木の支柱	[{"path": "Object/Plant support for Trees - Reference Picture.webp", "type": "reference", "original_name": "Plant support for Trees"}]	\N	\N	\N	2026-02-12 13:56:17.409842+00	\N
12	Sticks to make plants stand (DAISO or hardware store style)	園芸用支柱 (engei-yō shichū)・支柱 (shichū)	[{"path": "Object/Sticks to make plants stand (DAISO or hardware store style) - Reference Picture.webp", "type": "reference", "original_name": "Sticks to make plants stand (DAISO or hardware store style)"}]	Supporting climbing or top-heavy plants.	Arranging multiple sticks diagonally to form a decorative pattern for vines.	\N	2026-02-12 13:56:17.409842+00	\N
13	Trash sack	ゴミ袋 (gomi-bukuro)	[{"path": "Object/Trash sack - Reference Picture.webp", "type": "reference", "original_name": "Trash sack"}]	Collecting garbage.	\N	\N	2026-02-12 13:56:17.409842+00	\N
14	Trash Net	ゴミネット	[{"path": "Object/Trash Net - Reference Picture.webp", "type": "reference", "original_name": "Trash Net"}]	To keep animals away from the trash.	\N	\N	2026-02-12 13:56:17.409842+00	\N
15	LED Garden light	LEDガーデンライト (LED gāden raito)・ガーデンライト (gāden raito)	[{"path": "Object/LED Garden light - Reference Picture.webp", "type": "reference", "original_name": "LED Garden light"}]	Outdoor lighting.	\N	Cool blog review about it: https://blog.goo.ne.jp/shishimaru41/e/97764778ce8f21f9321bdc3f3f4d5c26	2026-02-12 13:56:17.409842+00	\N
16	Bucket	バケツ (baketsu)	[{"path": "Object/Bucket - Reference Picture.webp", "type": "reference", "original_name": "Bucket"}]	Carrying water/cleaning.	Abandoned water buckets. Sometimes used to keep other items tidy.	\N	2026-02-12 13:56:17.409842+00	\N
17	Random Personal	私物 (shibutsu) = “pertences pessoais”	[]	Varied (toys, figurines, etc.).	\N	\N	2026-02-12 13:56:17.409842+00	\N
18	Bamboo broom	枝箒 (eda-bōki)・竹ぼうき (take-bōki）	[{"path": "Object/Bamboo broom - Reference Picture.webp", "type": "reference", "original_name": "Bamboo broom"}]	Sweeping leaves/dirt	\N	\N	2026-02-12 13:56:17.409842+00	\N
19	Tanuki Statue	タヌキの置物	[{"path": "Object/Tanuki Statue - Reference Picture.webp", "type": "reference", "original_name": "Tanuki Statue"}]	Folkloric statue representing the tanuki spirit, often for business prosperity, good fortune.	\N	\N	2026-02-12 13:56:17.409842+00	\N
20	Shimenawa	しめ縄	[{"path": "Object/Shimenawa - Reference Picture.webp", "type": "reference", "original_name": "Shimenawa"}]	Shinto rope marking sacred or purified areas.	\N	\N	2026-02-12 13:56:17.409842+00	\N
21	Lantern	灯籠 (tōrō)・ランタン (rantan)	[{"path": "Object/Lantern - Reference Picture.webp", "type": "reference", "original_name": "Lantern"}]	Lighting (traditional stone or metal lanterns in Japanese gardens).	Sometimes lit during Obon or other festivals as a symbolic guide for ancestral spirits.	\N	2026-02-12 13:56:17.409842+00	\N
22	Solar Energy Dancing Dolls	ソーラーダンスおもちゃ	[{"path": "Object/Solar Energy Dancing Dolls - Reference Picture.webp", "type": "reference", "original_name": "Solar Energy Dancing Dolls"}]	\N	Spraying water over concrete or stone areas to create a refreshing evaporative cool, a common practice in older neighborhoods (打ち水 uchimizu).	\N	2026-02-12 13:56:17.409842+00	\N
23	Hose	ホース	[{"path": "Object/Hose - Reference Picture.webp", "type": "reference", "original_name": "Hose"}]	Watering, cleaning.	\N	\N	2026-02-12 13:56:17.409842+00	\N
24	Watering Can	ジョウロ	[{"path": "Object/Watering Can - Reference Picture.webp", "type": "reference", "original_name": "Watering Can"}]	Hand-watering plants.	\N	\N	2026-02-12 13:56:17.409842+00	\N
25	Rake	レーキ	[{"path": "Object/Rake - Reference Picture.webp", "type": "reference", "original_name": "Rake"}]	Gathering leaves, leveling soil/gravel.	\N	\N	2026-02-12 13:56:17.409842+00	\N
26	Shovel	スコップ	[{"path": "Object/Shovel - Reference Picture.webp", "type": "reference", "original_name": "Shovel"}]	Digging, moving soil.	It's common to see small shovels in gardens, usually mass produced models selled by DAISO and home hardware stores.	\N	2026-02-12 13:56:17.409842+00	\N
27	Pruning Shears	剪定ばさみ, sentei-basami	[{"path": "Object/Pruning Shears - Reference Picture.webp", "type": "reference", "original_name": "Pruning Shears"}]	Cutting, shaping plants, removing dead wood.	Essential for maintaining miniature trees.	\N	2026-02-12 13:56:17.409842+00	\N
28	Gardening Gloves	園芸用手袋 (engei-yō tebukuro) / ガーデニンググローブ (gadeningu gurōbu).	[{"path": "Object/Gardening Gloves - Reference Picture.webp", "type": "reference", "original_name": "Gardening Gloves"}]	Hand protection from dirt, cuts.	\N	\N	2026-02-12 13:56:17.409842+00	\N
29	Trelice	トレリス	[]	\N	I saw a beautiful manufactural process of a trelice on my way to school. A man was trying to grow grapes! And I watched all steps of the process. It's still there and sometimes there are beautiful grapes.	\N	2026-02-12 13:56:17.409842+00	\N
30	Vasos Suspensos	ハンギングプランター (hangingu purantā) / 吊り鉢 (tsuri-bachi)	[]	\N	\N	\N	2026-02-12 13:56:17.409842+00	\N
31	Furin	風鈴, fūrin	[{"path": "Object/Furin - Reference Picture.webp", "type": "reference", "original_name": "Furin"}]	\N	\N	\N	2026-02-12 13:56:17.409842+00	\N
32	Tsukubai	つくばい (tsukubai)	[]	\N	Attract small birds seeking water in urban areas.	\N	2026-02-12 13:56:17.409842+00	\N
33	Wooden Bench	ベンチ (benchi)	[]	\N	Only saw it in larger gardens.	\N	2026-02-12 13:56:17.409842+00	\N
34	Bamboo Fences	竹垣, takegaki	[]	Privacy, boundary marking.	\N	\N	2026-02-12 13:56:17.409842+00	\N
35	Stepping Stones	飛石, tobi-ishi	[]	\N	\N	\N	2026-02-12 13:56:17.409842+00	\N
36	Mosquito coil	蚊取り線香, katori senkō	[{"path": "Object/Mosquito coil - Reference Picture.webp", "type": "reference", "original_name": "Mosquito coil"}]	Repelling mosquitoes by burning pyrethrum-based coil	More common in summer, it leaves specific scents in the air.	\N	2026-02-12 13:56:17.409842+00	\N
37	Netting	ネット	[{"path": "Object/Netting - Reference Picture.webp", "type": "reference", "original_name": "Netting"}]	\N	Common in houses that have vegetable gardens. I see it a lot when people are trying to grow trelises, specially to give some privacy in windows and varandas.	\N	2026-02-12 13:56:17.409842+00	\N
38	Fish tank	睡蓮鉢	[{"path": "Object/Fish tank - Reference Picture.webp", "type": "reference", "original_name": "Fish tank"}]	\N	I mostly always find the tanks in a bad situation when I see them in the house gardens. In a sunny spot, dirty or too full.	\N	2026-02-12 13:56:17.409842+00	\N
39	Signs	看板, kanban	[]	Communication—warnings, instructions, etc.	Very funny to see these signs, sometimes you can find them in foreign languages too, which is even more interesting. Most of them ask people not to litter, specially cigar butts. There are many asking to not allow pets to pee or poo.	\N	2026-02-12 13:56:17.409842+00	\N
40	Human hand	手	[{"path": "Object/Human hand - Reference Picture.webp", "type": "reference", "original_name": "Human hand"}]	\N	\N	\N	2026-02-12 13:56:17.409842+00	\N
\.


--
-- Name: fauna_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fauna_id_seq', 68, true);


--
-- Name: flora_angiosperm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flora_angiosperm_id_seq', 84, true);


--
-- Name: flora_bryophyte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flora_bryophyte_id_seq', 6, true);


--
-- Name: flora_gimnosperma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flora_gimnosperma_id_seq', 3, true);


--
-- Name: flora_pteridophyte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.flora_pteridophyte_id_seq', 1, true);


--
-- Name: garden_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.garden_styles_id_seq', 16, true);


--
-- Name: objects_and_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.objects_and_other_id_seq', 40, true);


--
-- Name: fauna fauna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fauna
    ADD CONSTRAINT fauna_pkey PRIMARY KEY (id);


--
-- Name: flora_angiosperm flora_angiosperm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_angiosperm
    ADD CONSTRAINT flora_angiosperm_pkey PRIMARY KEY (id);


--
-- Name: flora_bryophyte flora_bryophyte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_bryophyte
    ADD CONSTRAINT flora_bryophyte_pkey PRIMARY KEY (id);


--
-- Name: flora_gimnosperma flora_gimnosperma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_gimnosperma
    ADD CONSTRAINT flora_gimnosperma_pkey PRIMARY KEY (id);


--
-- Name: flora_pteridophyte flora_pteridophyte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flora_pteridophyte
    ADD CONSTRAINT flora_pteridophyte_pkey PRIMARY KEY (id);


--
-- Name: garden_styles garden_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.garden_styles
    ADD CONSTRAINT garden_styles_pkey PRIMARY KEY (id);


--
-- Name: objects_and_other objects_and_other_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.objects_and_other
    ADD CONSTRAINT objects_and_other_pkey PRIMARY KEY (id);


--
-- Name: ix_fauna_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_fauna_id ON public.fauna USING btree (id);


--
-- Name: ix_fauna_popular_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_fauna_popular_name_en ON public.fauna USING btree (popular_name_en);


--
-- Name: ix_fauna_scientific_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_fauna_scientific_name ON public.fauna USING btree (scientific_name);


--
-- Name: ix_flora_angiosperm_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_angiosperm_id ON public.flora_angiosperm USING btree (id);


--
-- Name: ix_flora_angiosperm_popular_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_angiosperm_popular_name_en ON public.flora_angiosperm USING btree (popular_name_en);


--
-- Name: ix_flora_angiosperm_scientific_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_angiosperm_scientific_name ON public.flora_angiosperm USING btree (scientific_name);


--
-- Name: ix_flora_bryophyte_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_bryophyte_id ON public.flora_bryophyte USING btree (id);


--
-- Name: ix_flora_bryophyte_popular_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_bryophyte_popular_name_en ON public.flora_bryophyte USING btree (popular_name_en);


--
-- Name: ix_flora_bryophyte_scientific_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_bryophyte_scientific_name ON public.flora_bryophyte USING btree (scientific_name);


--
-- Name: ix_flora_gimnosperma_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_gimnosperma_id ON public.flora_gimnosperma USING btree (id);


--
-- Name: ix_flora_gimnosperma_popular_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_gimnosperma_popular_name_en ON public.flora_gimnosperma USING btree (popular_name_en);


--
-- Name: ix_flora_gimnosperma_scientific_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_gimnosperma_scientific_name ON public.flora_gimnosperma USING btree (scientific_name);


--
-- Name: ix_flora_pteridophyte_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_pteridophyte_id ON public.flora_pteridophyte USING btree (id);


--
-- Name: ix_flora_pteridophyte_popular_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_pteridophyte_popular_name_en ON public.flora_pteridophyte USING btree (popular_name_en);


--
-- Name: ix_flora_pteridophyte_scientific_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_flora_pteridophyte_scientific_name ON public.flora_pteridophyte USING btree (scientific_name);


--
-- Name: ix_garden_styles_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_garden_styles_id ON public.garden_styles USING btree (id);


--
-- Name: ix_garden_styles_popular_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_garden_styles_popular_name_en ON public.garden_styles USING btree (popular_name_en);


--
-- Name: ix_objects_and_other_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_objects_and_other_id ON public.objects_and_other USING btree (id);


--
-- Name: ix_objects_and_other_popular_name_en; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_objects_and_other_popular_name_en ON public.objects_and_other USING btree (popular_name_en);


--
-- PostgreSQL database dump complete
--

\unrestrict fkunuJytaHs9rvlJHz2I4jXbLqIYfE6EQaquz3DnPLgPh771coPxC1WfhFMxgpe

