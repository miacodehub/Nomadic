INSERT INTO places (name, description, lat, lng, tags, popularity) VALUES

-- Rome
('Centrale Montemartini', 'Former power plant turned museum, ancient Roman sculptures displayed among industrial-era machinery, rarely crowded', 41.8580, 12.4802, ARRAY['historic', 'museum', 'hidden'], 15),
('Quartiere Coppedè', 'Eccentric early-20th-century architectural district mixing Art Nouveau, Baroque and medieval styles, mostly unknown to tourists', 41.9177, 12.4966, ARRAY['historic', 'architecture', 'hidden'], 10),
('Basilica di San Clemente', 'Church built atop a 4th-century basilica atop a 1st-century Roman house and temple, layered history underground', 41.8897, 12.4975, ARRAY['historic', 'quiet'], 18),
('Protestant Cemetery', 'Quiet historic cemetery for non-Catholics, including Keats'' grave, peaceful and little-visited', 41.8756, 12.4802, ARRAY['historic', 'quiet'], 12),
('Aventine Keyhole', 'Famous keyhole view of St. Peter''s dome through a garden gate, overlooked despite being free and iconic', 41.8827, 12.4789, ARRAY['viewpoint', 'hidden'], 20),

-- Kyoto
('Fushimi Inari Upper Trails', 'Beyond the famous torii gate photos, the upper mountain trails are quiet and forested, most visitors turn back early', 34.9671, 135.7727, ARRAY['historic', 'nature', 'hidden'], 25),
('Philosopher''s Path Side Temples', 'Small temples just off the famous canal path, overshadowed by nearby Ginkaku-ji', 35.0272, 135.7944, ARRAY['historic', 'temple', 'quiet'], 14),
('Nonomiya Shrine', 'Small moss-covered shrine tucked beside the famous Arashiyama bamboo grove, often walked past', 35.0170, 135.6717, ARRAY['historic', 'shrine', 'hidden'], 11),
('Rozan-ji Temple', 'Quiet temple linked to the author of The Tale of Genji, rarely visited despite literary significance', 35.0254, 135.7622, ARRAY['historic', 'temple', 'quiet'], 8),
('Shimogamo Shrine Forest Path', 'Ancient forest walk leading to one of Kyoto''s oldest shrines, peaceful even during peak tourist season', 35.0387, 135.7728, ARRAY['historic', 'nature', 'quiet'], 13),

-- Istanbul
('Chora Church (Kariye)', 'Byzantine church with extraordinary mosaics, overshadowed by Hagia Sophia despite comparable significance', 41.0311, 28.9392, ARRAY['historic', 'quiet'], 22),
('Basilica Cistern - Lesser Rooms', 'The main cistern is famous, but the quieter side chambers are often skipped by tour groups', 41.0084, 28.9779, ARRAY['historic', 'hidden'], 19),
('Pierre Loti Hill', 'Hilltop cafe and viewpoint reached by cable car, overlooks the Golden Horn, popular with locals not tourists', 41.0553, 28.9339, ARRAY['viewpoint', 'quiet'], 17),
('Zeyrek Mosque', 'Former Byzantine church (Pantokrator Monastery), significant history, rarely visited compared to Hagia Sophia', 41.0183, 28.9553, ARRAY['historic', 'hidden'], 9),
('Büyük Valide Han', 'Massive Ottoman-era caravanserai, still inhabited by small workshops, largely unknown to visitors', 41.0138, 28.9696, ARRAY['historic', 'hidden'], 7),

-- Prague
('Vyšehrad', 'Historic fortress and cemetery overlooking the Vltava, far quieter than Prague Castle despite similar views', 50.0637, 14.4186, ARRAY['historic', 'fort', 'viewpoint'], 24),
('Petřín Hill Mirror Maze', 'Quirky mirror maze and lookout tower atop a quiet hill park, overshadowed by the Charles Bridge crowds', 50.0836, 14.3953, ARRAY['historic', 'quiet'], 16),
('Church of Our Lady Victorious', 'Home to the Infant of Prague statue, small and often bypassed by castle-bound tourists', 50.0870, 14.4036, ARRAY['historic', 'quiet'], 10),
('Old Jewish Cemetery Side Entrance', 'Centuries-old cemetery with layered graves, quieter entry points avoid the main tourist crush', 50.0903, 14.4192, ARRAY['historic', 'quiet'], 14),
('Vrtba Garden', 'Baroque terraced garden with sweeping city views, rarely crowded compared to other Prague viewpoints', 50.0870, 14.4011, ARRAY['nature', 'viewpoint', 'hidden'], 11),

-- Mexico City
('Templo Mayor Museum Side Wing', 'Aztec ruins beneath the modern city, the side wing exhibits are often skipped by visitors rushing to the main site', 19.4347, -99.1322, ARRAY['historic', 'museum', 'hidden'], 20),
('Casa Azul Side Gardens', 'Frida Kahlo''s home draws crowds for the main rooms, the garden courtyard is quieter and reflective', 19.3551, -99.1624, ARRAY['historic', 'quiet'], 23),
('Capilla del Pocito', 'Small Baroque chapel beside the Basilica of Guadalupe, overshadowed by the main basilica entirely', 19.4836, -99.1176, ARRAY['historic', 'quiet'], 9),
('Panteón de Dolores', 'Vast historic cemetery with elaborate tombs of notable Mexicans, rarely visited by tourists', 19.4150, -99.1950, ARRAY['historic', 'quiet'], 6),
('Castillo de Chapultepec Back Terrace', 'The castle''s main halls draw crowds, the rear terrace gardens are peaceful and often empty', 19.4204, -99.1817, ARRAY['historic', 'viewpoint', 'quiet'], 18),


-- Barcelona
('Bunkers del Carmel', 'Former anti-aircraft gun bunkers turned panoramic viewpoint, known mostly to locals for sunset views over the city', 41.4198, 2.1583, ARRAY['viewpoint', 'historic', 'hidden'], 22),
('Hospital de Sant Pau', 'Modernist hospital complex by Domènech i Montaner, overshadowed by Gaudí but equally significant architecturally', 41.4133, 2.1742, ARRAY['historic', 'architecture', 'quiet'], 16),
('Refugi 307', 'Civil War-era underground bomb shelter open for tours, little-known piece of the city''s wartime history', 41.3745, 2.1662, ARRAY['historic', 'hidden'], 7),
('Jardins de Mossèn Costa i Llobera', 'Cactus garden terraced into a hillside overlooking the sea, rarely crowded despite the views', 41.3664, 2.1646, ARRAY['nature', 'viewpoint', 'quiet'], 9),
('Temple of Augustus', 'Roman temple ruins hidden inside a courtyard off a narrow Gothic Quarter street, easy to walk past', 41.3830, 2.1764, ARRAY['historic', 'hidden'], 6),

-- Marrakech
('Le Jardin Secret', 'Restored Islamic palace garden in the medina, quieter alternative to the more famous Majorelle Garden', 31.6324, -7.9892, ARRAY['historic', 'nature', 'quiet'], 18),
('Dar Si Said Museum', 'Museum of Moroccan arts housed in a 19th-century palace, consistently overlooked by Bahia Palace visitors nearby', 31.6280, -7.9856, ARRAY['historic', 'museum', 'hidden'], 10),
('Tombeaux Saadiens Side Chambers', 'The Saadian Tombs draw crowds for the main hall, the smaller side chambers are quieter and ornately tiled', 31.6197, -7.9881, ARRAY['historic', 'quiet'], 19),
('Maison de la Photographie', 'Rooftop museum of vintage Moroccan photography, peaceful courtyard café above the medina chaos', 31.6324, -7.9850, ARRAY['historic', 'museum', 'quiet'], 12),
('Koutoubia Gardens Back Path', 'The mosque and main gardens draw crowds, a quieter back path offers the same minaret views', 31.6242, -7.9933, ARRAY['historic', 'viewpoint', 'quiet'], 14),

-- Hanoi
('Temple of Literature Side Courtyards', 'Vietnam''s first university, the rear courtyards are far quieter than the crowded main entrance', 21.0294, 105.8355, ARRAY['historic', 'quiet'], 20),
('Hoa Lo Prison Museum', 'Former French colonial prison, later used in the Vietnam War, historically dense and often skipped by tourists', 21.0252, 105.8467, ARRAY['historic', 'hidden'], 11),
('Tran Quoc Pagoda', 'Vietnam''s oldest Buddhist pagoda on a small peninsula in West Lake, peaceful despite central location', 21.0469, 105.8372, ARRAY['historic', 'quiet'], 17),
('Long Bien Bridge Walkway', 'Historic French colonial-era bridge, locals walk and cycle it daily, rarely visited by tourists', 21.0425, 105.8600, ARRAY['historic', 'hidden'], 8),
('Ngoc Son Temple', 'Small temple on an island in Hoan Kiem Lake, reached by a red wooden bridge, quieter in early morning', 21.0317, 105.8525, ARRAY['historic', 'quiet'], 15),

-- Athens
('Kerameikos', 'Ancient Greek cemetery and city gate ruins, far less crowded than the Acropolis despite similar age', 37.9778, 23.7183, ARRAY['historic', 'quiet'], 16),
('Anafiotika', 'Tiny whitewashed Cycladic-style neighborhood tucked beneath the Acropolis, built by island workers in the 1800s', 37.9731, 23.7275, ARRAY['historic', 'hidden'], 21),
('Panathenaic Stadium', 'Marble stadium that hosted the first modern Olympics, often skipped in favor of the Acropolis', 37.9683, 23.7414, ARRAY['historic', 'quiet'], 19),
('Mount Lycabettus Lower Trails', 'Most visitors take the funicular to the top, the lower forested trails are quiet and shaded', 37.9775, 23.7453, ARRAY['nature', 'viewpoint', 'hidden'], 13),
('Roman Agora', 'Roman-era marketplace ruins beside the more famous Ancient Agora, quieter and less visited', 37.9755, 23.7264, ARRAY['historic', 'quiet'], 14),

-- Buenos Aires
('Recoleta Cemetery Back Rows', 'Famous for Evita''s tomb near the entrance, the back rows hold equally ornate mausoleums with no crowds', -34.5875, -58.3932, ARRAY['historic', 'quiet'], 18),
('Museo Casa Rosada', 'Underground museum beneath the presidential palace, showcasing original colonial-era ruins, rarely visited', -34.6083, -58.3700, ARRAY['historic', 'museum', 'hidden'], 9),
('Basílica de San Francisco', 'Baroque church with Guaraní-influenced wood carvings, overshadowed by the Metropolitan Cathedral', -34.6100, -58.3708, ARRAY['historic', 'quiet'], 10),
('Pasaje Lanín', 'Residential alley covered floor-to-ceiling in colorful murals by a local folk artist, known mostly to locals', -34.6328, -58.4442, ARRAY['art', 'hidden'], 7),
('El Zanjón de Granados', 'Underground tunnels and foundations beneath a La Boca house, tracing the city''s earliest colonial history', -34.6158, -58.3717, ARRAY['historic', 'hidden'], 6);