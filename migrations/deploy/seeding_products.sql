-- Deploy e-shoes:seeding_products to pg

BEGIN;

INSERT INTO "genre" (nom)
VALUES 
('femme'),
('homme'),
('mixte'),
('enfant');

INSERT INTO "produit" (reference, nom, marque, prix, photos, dessus, doublure, semelle_proprete, semelle_usure, epaisseur_doublure, matiere, temps, sport, bout, forme_talon, fermeture, motif, info_sup, proprietes, genre_id)
VALUES 
('B4G11A00K-Q11', 'Sasha', 'Balagan', 111.75, 'B4G11A00K-Q11_1|B4G11A00K-Q11_2|B4G11A00K-Q11_3|B4G11A00K-Q11_4', 'Cuir', '100 % coton', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Plat', 'Sans lacets', 'Couleur unie', '', '', 1),
('HU711N029-Q11', 'Tabita Rain Bootie', 'Hugo', 99.95, 'HU711N029-Q11_1|HU711N029-Q11_2|HU711N029-Q11_3|HU711N029-Q11_4|HU711N029-Q11_5|HU711N029-Q11_6|HU711N029-Q11_7', 'Matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Non doublé', '', 'Pluie', '', 'Rond', 'Plat', 'Sans lacets', 'Couleur unie', '', 'Imperméable', 1),
('K0Q11A096-H11', 'Santa', 'Kazar', 199.99, 'K0Q11A096-H11_1|K0Q11A096-H11_2|K0Q11A096-H11_3|K0Q11A096-H11_4', 'Suède', 'Textile', 'Cuir', 'Thunit résistant à l''abrasion', 'Non doublé', '', '', '', 'Pointu', 'Talon aiguille', 'Fermeture éclair', 'Couleur unie', '', '', 1),
('M4511X00A-Q11', 'Glance', 'Moon Boot', 170, 'M4511X00A-Q11_1|M4511X00A-Q11_2|M4511X00A-Q11_3|M4511X00A-Q11_4|M4511X00A-Q11_5|M4511X00A-Q11_6|M4511X00A-Q11_7', 'Matière synthétique / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure chaude', '', 'Neige', '', 'Rond', 'Plat', 'Sans lacets', 'Imprimé', '', '', 1),
('STH11A0JT-Q11', 'Mit Profilsohle', 'Stradivarius', 59.99, 'STH11A0JT-Q11_1|STH11A0JT-Q11_2|STH11A0JT-Q11_3|STH11A0JT-Q11_4|STH11A0JT-Q11_5|STH11A0JT-Q11_6', 'Matière synthétique', 'Polyester', 'Synthétique', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Plateforme', 'Sans lacets', 'Couleur unie', '', '', 1),
('CA311N0Z6-Q11', 'Bonnie', 'Camper', 133, 'CA311N0Z6-Q11_1|CA311N0Z6-Q11_2|CA311N0Z6-Q11_3|CA311N0Z6-Q11_4|CA311N0Z6-Q11_5', 'Cuir', 'Textile', 'Cuir', 'Caoutchouc naturel', '', '', '', '', 'Rond', 'Bloc', 'Sans lacets', 'Couleur unie', 'Ganse élastique', 'Respirant', 1),
('CA311N07Z-M11', 'Thelma', 'Camper', 199, 'CA311N07Z-M11_1|CA311N07Z-M11_2|CA311N07Z-M11_3|CA311N07Z-M11_4|CA311N07Z-M11_5', 'Textile', 'Imitation cuir / textile', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', 'Tricot / maille', '', '', 'Rond', 'Bloc, plateforme', 'Sans lacets', 'Couleur unie', '', '', 1),
('DO211N09X-Q11', 'Jadon II Star', 'Dr. Martens', 143.95, 'DO211N09X-Q11_1|DO211N09X-Q11_2|DO211N09X-Q11_3|DO211N09X-Q11_4|DO211N09X-Q11_5|DO211N09X-Q11_6', 'Cuir', 'Doublure en cuir / textile', 'Combinaison cuir / textile', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Bloc, plateforme', 'Fermeture éclair', 'Couleur unie', 'Découpes', '', 1),
('P1315K03K-N11', 'Pampa HI Supply Unisex', 'Palladium', 84.95, 'P1315K03K-N11_1|P1315K03K-N11_2|P1315K03K-N11_3|P1315K03K-N11_4|P1315K03K-N11_5|P1315K03K-N11_6', 'Coton', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Plat', 'Laçage', 'Couleur unie', '', '', 3),
('PUC11A0GY-Q11', '', 'Pull & Bear', 27.99, 'PUC11A0GY-Q11_1|PUC11A0GY-Q11_2|PUC11A0GY-Q11_3|PUC11A0GY-Q11_4|PUC11A0GY-Q11_5|PUC11A0GY-Q11_6|PUC11A0GY-Q11_7', 'Matière synthétique', 'Polyester', 'Synthétique', 'Matière synthétique', '', '', '', '', 'Rond', 'Bloc', 'Sans lacets', 'Couleur unie', '', '', 1),
('AS141A0TN-E11', 'Noosa TRI 14', 'Asics', 119.95, 'AS141A0TN-E11_1|AS141A0TN-E11_2|AS141A0TN-E11_3|AS141A0TN-E11_4|AS141A0TN-E11_5|AS141A0TN-E11_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', 'Mesh', '', 'Running', 'Rond', 'Plat', 'Laçage', 'Multicolor', 'Découpes', 'Respirant', 1),
('L0641A01A-E11', 'Athleisure', 'Lacoste Sport', 130, 'L0641A01A-E11 _1|L0641A01A-E11 _2|L0641A01A-E11 _3|L0641A01A-E11 _4', 'Cuir / matière synthétique', 'Polyester', 'Synthétique', 'Matière synthétique', 'Doublure protégeant du froid', '', '', 'Fitness', 'Rond', 'Bloc, plateforme', 'Laçage', '', '', '', 1),
('N1241A14Z-J12', 'Zoom Fly 5', 'Nike Performance', 169.95, 'N1241A14Z-J12_1|N1241A14Z-J12_2|N1241A14Z-J12_3|N1241A14Z-J12_4|N1241A14Z-J12_5|N1241A14Z-J12_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh', '', 'Running', 'Rond', 'Plat', 'Laçage', 'Imprimé', '', 'Respirant', 1),
('PU141A0T2-Q11', 'Pwrframe TR Safari Glam', 'Puma', 75.95, 'PU141A0T2-Q11_1|PU141A0T2-Q11_2|PU141A0T2-Q11_3|PU141A0T2-Q11_4|PU141A0T2-Q11_5|PU141A0T2-Q11_6|PU141A0T2-Q11_7', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', 'Fitness', 'Rond', 'Plat', 'Laçage', 'Imprimé animal', '', '', 1),
('SA541A0F4-C11', 'Supercross 4', 'Salomon', 129.95, 'SA541A0F4-C11_1|SA541A0F4-C11_2|SA541A0F4-C11_3|SA541A0F4-C11_4|SA541A0F4-C11_5|SA541A0F4-C11_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', '', '', 'Randonnée, running', 'Rond', 'Plat', 'Laçage', 'Imprimé', 'Découpes', '', 1),
('BB111B033-Q11', 'Janet Slingback', 'Boss', 249.95, 'BB111B033-Q11_1|BB111B033-Q11_2|BB111B033-Q11_3|BB111B033-Q11_4|BB111B033-Q11_5|BB111B033-Q11_6|BB111B033-Q11_7', 'Cuir / matière synthétique', 'Cuir', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Pointu', 'Talon aiguille', 'Laçage', 'Carreaux', '', '', 1),
('EV411B04G-Q13', '', 'Even & Odd', 44.99, 'EV411B04G-Q13_1|EV411B04G-Q13_2|EV411B04G-Q13_3|EV411B04G-Q13_4|EV411B04G-Q13_5|EV411B04G-Q13_6', 'Textile', 'Imitation cuir / textile', 'Imitation cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Bloc, plateforme', 'Boucle', 'Couleur unie', '', '', 1),
('NEG11B00H-A11', 'Decore Bow', 'Nly by Nelly', 69.95, 'NEG11B00H-A11_1|NEG11B00H-A11_2|NEG11B00H-A11_3|NEG11B00H-A11_4|NEG11B00H-A11_5|NEG11B00H-A11_6', 'Tissu / matière synthétique', 'Imitation cuir', 'Imitation cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Pointu', 'Entonnoir', 'Boucle', 'Couleur unie', 'Strass, Nœud décoratif, Ganse élastique', '', 1),
('ST311B05G-D11', 'Valance', 'Steve Madden', 129.95, 'ST311B05G-D11_1|ST311B05G-D11_2|ST311B05G-D11_3|ST311B05G-D11_4|ST311B05G-D11_5|ST311B05G-D11_6', 'Matière synthétique', 'Synthétique', 'Imitation cuir', 'Matière synthétique', 'Non doublé', '', '', '', 'Pointu', 'Talon aiguille', 'Boucle', 'Multicolor', 'Strass, Nœud décoratif', '', 1),
('STH11B03D-I11', 'Mit Absatz', 'Stradivarius', 29.99, 'STH11B03D-I11_1|STH11B03D-I11_2|STH11B03D-I11_3|STH11B03D-I11_4|STH11B03D-I11_5|STH11B03D-I11_6|STH11B03D-I11_7', 'Polyester', 'Polyester', 'Synthétique', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Pointu', 'Talon aiguille', 'Lanière', 'Imprimé animal', '', '', 1),
('CA311A18Z-M11', 'Kobarah', 'Camper', 125, 'CA311A18Z-M11_1|CA311A18Z-M11_2|CA311A18Z-M11_3|CA311A18Z-M11_4|CA311A18Z-M11_5', 'Matière synthétique', 'Synthétique', 'Synthétique', 'Matière synthétique', '', '', '', '', 'Ouvert', 'Bloc', 'Sans lacets', 'Couleur unie', '', '', 1),
('AY511A004-F11', 'Cindy', 'Mango Kids', 49.99, 'AY511A004-F11_1|AY511A004-F11_2|AY511A004-F11_3|AY511A004-F11_4|AY511A004-F11_5', 'Polyuréthane', 'Polyester', 'Synthétique', 'Caoutchouc naturel', 'Non doublé', '', '', '', 'Ouvert', 'Bloc', 'Laçage', 'Couleur unie', '', '', 1),
('MIF11A04S-F11', '', 'Minelli', 109.95, 'MIF11A04S-F11_1|MIF11A04S-F11_2|MIF11A04S-F11_3|MIF11A04S-F11_4|MIF11A04S-F11_5|MIF11A04S-F11_6', 'Cuir', 'Cuir', 'Cuir', 'Thunit résistant à l''abrasion', 'Doublure protégeant du froid', '', '', '', 'Ouvert', 'Bloc', 'Boucle', 'Couleur unie', 'Ganse élastique', '', 1),
('MIF11A04U-A11', '', 'Minelli', 119.95, 'MIF11A04U-A11_1|MIF11A04U-A11_2|MIF11A04U-A11_3|MIF11A04U-A11_4|MIF11A04U-A11_5|MIF11A04U-A11_6', 'Cuir', 'Cuir', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Ouvert', 'Bloc', 'Boucle', 'Couleur unie', 'Ganse élastique', '', 1),
('NL011A0XY-J11', 'Wide Fit Block Heel', 'New Look Wide Fit', 39.99, 'NL011A0XY-J11_1|NL011A0XY-J11_2|NL011A0XY-J11_3', 'Polyester', 'Doublure en synthétique', 'Synthétique', 'Matière synthétique', 'Doublure protégeant du froid', 'Satin', '', '', 'Ouvert', 'Bloc', 'Boucle', 'Couleur unie', '', '', 1),
('IC142A00I-N11', 'Adour MR', 'Icepeak', 89.95, 'IC142A00I-N11_1|IC142A00I-N11_2|IC142A00I-N11_3|IC142A00I-N11_4|IC142A00I-N11_5|IC142A00I-N11_6', 'Imitation cuir / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Cuir synthétique', 'Pluie', 'Randonnée, randonnée urbaine', 'Rond', '', 'Laçage', '', 'Découpes', 'Respirant, imperméable', 2),
('RE542A0QL-Q11', 'Work N Cushion 4.0 KC', 'Reebok', 49.95, 'RE542A0QL-Q11_1|RE542A0QL-Q11_2|RE542A0QL-Q11_3|RE542A0QL-Q11_4|RE542A0QL-Q11_5|RE542A0QL-Q11_6', 'Cuir et textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', 'Running', 'Rond', 'Plat', 'A scratch', 'Couleur unie', 'Découpes', '', 2),
('SA542A0HE-C11', 'Cross Hike Mid GTX 2', 'Salomon', 134.95, 'SA542A0HE-C11_1|SA542A0HE-C11_2|SA542A0HE-C11_3|SA542A0HE-C11_4|SA542A0HE-C11_5|SA542A0HE-C11_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', '', 'Pluie', 'Randonnée', 'Rond', '', 'Laçage', 'Imprimé', '', 'Respirant, imperméable', 2),
('SA542A0IO-C11', 'X Braze', 'Salomon', 89.95, 'SA542A0IO-C11_1|SA542A0IO-C11_2|SA542A0IO-C11_3|SA542A0IO-C11_4|SA542A0IO-C11_5|SA542A0IO-C11_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', '', '', 'Randonnée', 'Rond', '', 'Laçage', 'Couleur unie', 'Découpes', '', 2),
('TH312M007-C11', 'M Taraval Spirit', 'The North Face', 80, 'TH312M007-C11_1|TH312M007-C11_2|TH312M007-C11_3|TH312M007-C11_4|TH312M007-C11_5', 'Matière synthétique', 'Polyester', 'Synthétique', 'Caoutchouc résistant à l''abrasion', '', '', '', '', 'Rond', '', 'Laçage', '', '', '', 2),
('NE242A0H3-Q12', 'Mens Shando', 'New Balance', 95, 'NE242A0H3-Q12_1|NE242A0H3-Q12_2|NE242A0H3-Q12_3|NE242A0H3-Q12_4|NE242A0H3-Q12_5|NE242A0H3-Q12_6', 'Imitation cuir / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh, cuir synthétique', '', 'Running, Trail running', 'Rond', 'Plat', 'Laçage', 'Multicolor', 'Découpes', 'Respirant', 2),
('N1244A0H4-Q11', 'Air Zoom Pegasus 39', 'Nike Performance', 129.95, 'N1244A0H4-Q11_1|N1244A0H4-Q11_2|N1244A0H4-Q11_3|N1244A0H4-Q11_4|N1244A0H4-Q11_5|N1244A0H4-Q11_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', 'Running', 'Rond', '', 'Laçage', 'Imprimé', '', '', 2),
('N1242A2EX-C11', 'Giannis Immortality 2', 'Nike Performance', 84.95, 'N1242A2EX-C11_1|N1242A2EX-C11_2|N1242A2EX-C11_3|N1242A2EX-C11_4|N1242A2EX-C11_5|N1242A2EX-C11_6', 'Matière synthétique / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh', '', 'Basket-ball', 'Rond', '', 'Laçage', 'Imprimé', 'Découpes', 'Respirant', 2),
('RE542A0VO-Q11', 'Ridgerider', 'Reebok', 45.95, 'RE542A0VO-Q11_1|RE542A0VO-Q11_2|RE542A0VO-Q11_3|RE542A0VO-Q11_4|RE542A0VO-Q11_5|RE542A0VO-Q11_6', 'Matière synthétique / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', 'Running, Trail running', 'Rond', 'Plat', 'Laçage', 'Couleur unie', 'Découpes', '', 2),
('UN242A0HG-M11', 'Charged Bandit TR 2', 'Under Armour', 76.45, 'UN242A0HG-M11_1|UN242A0HG-M11_2|UN242A0HG-M11_3|UN242A0HG-M11_4|UN242A0HG-M11_5|UN242A0HG-M11_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh', '', 'Running, Trail running', 'Rond', 'Plat', 'Laçage', 'Couleur unie', '', '', 2),
('BPC12C00J-Q11', 'Air Brogue', 'Barleycorn', 278, 'BPC12C00J-Q11_1|BPC12C00J-Q11_2|BPC12C00J-Q11_3|BPC12C00J-Q11_4|BPC12C00J-Q11_5', 'Cuir', 'Doublure en cuir / textile', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', '', 'Laçage', 'Couleur unie', 'Bout fleuri', '', 2),
('BU112M0AM-O11', 'Lucas', 'Bugatti', 66.45, 'BU112M0AM-O11_1|BU112M0AM-O11_2|BU112M0AM-O11_3|BU112M0AM-O11_4|BU112M0AM-O11_5|BU112M0AM-O11_6', 'Cuir', 'Imitation cuir / textile', 'Imitation cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Bloc', 'Laçage', 'Couleur unie', '', '', 2),
('BU112M078-O11', 'Morino', 'Bugatti', 74.95, 'BU112M078-O11_1|BU112M078-O11_2|BU112M078-O11_3|BU112M078-O11_4|BU112M078-O11_5|BU112M078-O11_6', 'Cuir', 'Doublure en cuir / textile', 'Combinaison cuir / textile', 'Semelle synthétique avec amortisseur de chocs', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Bloc', 'Laçage', 'Couleur unie', '', '', 2),
('LL112A01H-O12', 'Langston', 'Lloyd', 148.4, 'LL112A01H-O12_1|LL112A01H-O12_2|LL112A01H-O12_3|LL112A01H-O12_4|LL112A01H-O12_5|LL112A01H-O12_6', 'Cuir', 'Doublure en cuir / textile', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Plat', 'Laçage', 'Couleur unie', '', '', 2),
('PI912M09F-O11', 'Leather', 'Pier One', 49.99, 'PI912M09F-O11_1|PI912M09F-O11_2|PI912M09F-O11_3|PI912M09F-O11_4|PI912M09F-O11_5|PI912M09F-O11_6', 'Cuir', 'Doublure en cuir / textile', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Bloc', 'Laçage', 'Couleur unie', 'Bout fleuri', '', 2),
('AD115G022-A11', 'Adilette Unisex', 'Adidas Originals', 64.95, 'AD115G022-A11_1|AD115G022-A11_2|AD115G022-A11_3|AD115G022-A11_4|AD115G022-A11_5|AD115G022-A11_6|AD115G022-A11_7', 'Matière synthétique', 'Synthétique', 'Synthétique', 'Matière synthétique', 'Non doublé', '', '', '', 'Rond', 'Plat', 'Sans lacets', 'Couleur unie', '', '', 3),
('CA312G02S-G11', 'Set', 'Camper', 135, 'CA312G02S-G11_1|CA312G02S-G11_2|CA312G02S-G11_3|CA312G02S-G11_4|CA312G02S-G11_5', 'Cuir et textile', '', 'Cuir', 'Matière synthétique', 'Non doublé', '', '', 'Randonnée urbaine', 'Ouvert', '', 'A scratch', '', '', 'Respirant', 2),
('CR415G02X-H11', 'Bayaband', 'Crocs', 54.99, 'CR415G02X-H11_1|CR415G02X-H11_2|CR415G02X-H11_3|CR415G02X-H11_4|CR415G02X-H11_5|CR415G02X-H11_6', 'Matière synthétique', 'Synthétique', 'Synthétique', 'Semelle synthétique avec amortisseur de chocs', 'Non doublé', '', '', 'Randonnée urbaine', 'Rond', 'Plat', 'Sans lacets', 'Imprimé', '', '', 2),
('NI112G00S-Q12', 'Victori One Slide', 'Nike Sportswear', 32.95, 'NI112G00S-Q12_1|NI112G00S-Q12_2|NI112G00S-Q12_3|NI112G00S-Q12_4|NI112G00S-Q12_5|NI112G00S-Q12_6', 'Imitation cuir haute-qualité', 'Textile', 'Synthétique', 'Matière synthétique', '', 'Cuir synthétique', '', '', 'Ouvert', 'Plat', 'Sans lacets', 'Imprimé', '', '', 2),
('PI915G007-O11', '', 'Pier One', 27.99, 'PI915G007-O11_1|PI915G007-O11_2|PI915G007-O11_3|PI915G007-O11_4|PI915G007-O11_5|PI915G007-O11_6', 'Suède', 'Textile', 'Cuir', 'Matière synthétique', 'Non doublé', '', '', '', 'Rond', 'Plat', 'Sans lacets', 'Couleur unie', '', '', 2),
('AS112O02I-Q11', 'Gel Venture', 'Asics SportStyle', 85.27, 'AS112O02I-Q11_1|AS112O02I-Q11_2|AS112O02I-Q11_3|AS112O02I-Q11_4|AS112O02I-Q11_5|AS112O02I-Q11_6|AS112O02I-Q11_7', 'Matière synthétique', 'Synthétique', 'Synthétique', 'Matière synthétique', '', '', '', '', 'Rond', '', 'Laçage', '', '', '', 2),
('BB112O06R-A15', 'Aiden Tenn LTB', 'Boss', 119.95, 'BB112O06R-A15_1|BB112O06R-A15_2|BB112O06R-A15_3|BB112O06R-A15_4|BB112O06R-A15_5|BB112O06R-A15_6', 'Imitation cuir haute-qualité', 'Textile', 'Textile', 'Matière synthétique', 'Non doublé', 'Cuir synthétique', '', '', 'Rond', '', 'Laçage', 'Couleur unie', '', '', 2),
('LA212O0IF-A11', 'Neo', 'Lacoste', 129.95, 'LA212O0IF-A11_1|LA212O0IF-A11_2|LA212O0IF-A11_3|LA212O0IF-A11_4|LA212O0IF-A11_5|LA212O0IF-A11_6', 'Cuir et textile', '100 % polyester', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh', '', '', 'Rond', '', 'Laçage', '', 'Deuxième paire de lacets incluse', '', 2),
('NI112O0D8-Q12', 'React Vision', 'Nike Sportswear', 120.95, 'NI112O0D8-Q12_1|NI112O0D8-Q12_2|NI112O0D8-Q12_3|NI112O0D8-Q12_4|NI112O0D8-Q12_5|NI112O0D8-Q12_6|NI112O0D8-Q12_7', 'Matière synthétique / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Plat', 'Laçage', 'Couleur unie', '', 'Respirant', 2),
('RE015B00G-A17', 'Club C 85 Unisex', 'Reebok Classic', 59.45, 'RE015B00G-A17_1|RE015B00G-A17_2|RE015B00G-A17_3|RE015B00G-A17_4|RE015B00G-A17_5|RE015B00G-A17_6', 'Cuir et textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Plat', 'Laçage', 'Couleur unie', '', '', 3),
('F5713I0D5-J11', 'Booties', 'Friboo', 30.45, 'F5713I0D5-J11_1|F5713I0D5-J11_2|F5713I0D5-J11_3|F5713I0D5-J11_4|F5713I0D5-J11_5|F5713I0D5-J11_6', 'Imitation cuir haute-qualité', 'Textile', 'Textile', 'Matière synthétique', 'Doublure chaude', 'Cuir synthétique', '', '', 'Rond', '', 'Fermeture éclair', 'Couleur unie', '', '', 4),
('GE113D0EE-D11', 'Inek Girl', 'Geox', 39, 'GE113D0EE-D11_1|GE113D0EE-D11_2|GE113D0EE-D11_3|GE113D0EE-D11_4|GE113D0EE-D11_5|GE113D0EE-D11_6', 'Imitation cuir / textile', 'Textile', 'Cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', '', 'A scratch', '', '', '', 4),
('QM413I004-Q11', 'Freshfeet', 'Marks & Spencer', 21.25, 'QM413I004-Q11_1', 'Polyuréthane', 'Imitation cuir', 'Imitation cuir', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', '', 'Fermeture éclair', 'Couleur unie', '', '', 4),
('M4513K00G-G11', 'Icon', 'Moon Boot', 220, 'M4513K00G-G11_1|M4513K00G-G11_2|M4513K00G-G11_3|M4513K00G-G11_4|M4513K00G-G11_5|M4513K00G-G11_6', 'Matière synthétique / textile', '100 % polyester', 'Textile', 'Matière synthétique', 'Doublure chaude', '', '', '', 'Rond', '', 'Sans lacets', 'Imprimé', '', '', 4),
('TI114I01O-B11', 'Field Trekker Mid', 'Timberland', 65.95, 'TI114I01O-B11_1', 'Cuir et textile', 'Synthétique', 'Synthétique', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', '', '', '', 'Rond', '', 'Laçage', 'Couleur unie', '', '', 4),
('BI114G010-N11', 'Arizona', 'Birkenstock', 32.65, 'BI114G010-N11_1|BI114G010-N11_2|BI114G010-N11_3|BI114G010-N11_4|BI114G010-N11_5|BI114G010-N11_6', 'Imitation cuir haute-qualité', 'Textile', 'Cuir', 'Matière synthétique', 'Non doublé', 'Cuir synthétique', '', '', 'Ouvert', '', 'Sans lacets', 'Camouflage', 'Boucle', '', 4),
('QM413L001-I11', 'Peppa Pig', 'Marks & Spencer', 8.75, 'QM413L001-I11_1|QM413L001-I11_2|QM413L001-I11_3', 'Textile', 'Textile', 'Synthétique', 'Matière synthétique', 'Doublure chaude', '', '', '', 'Rond', 'Plat', 'A scratch', 'Couleur unie', '', '', 4),
('NX314F00T-G11', 'Dinosaur', 'Next', 16, 'NX314F00T-G11_1|NX314F00T-G11_2|NX314F00T-G11_3|NX314F00T-G11_4', 'Textile', 'Doublure en textile', 'Textile', 'Matière synthétique', '', '', '', '', 'Rond', '', 'A scratch', 'Imprimé', '', '', 4),
('LE314L03N-M15', 'Bill', 'Superfit', 21.95, 'LE314L03N-M15_1|LE314L03N-M15_2|LE314L03N-M15_3|LE314L03N-M15_4|LE314L03N-M15_5|LE314L03N-M15_6', 'Textile', 'Textile', 'Textile', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', '', '', '', 'Rond', 'Plat', 'A scratch', 'Imprimé', '', '', 4),
('UG116L006-Q11', 'Tazz Unisex', 'Ugg', 89.95, 'UG116L006-Q11_1|UG116L006-Q11_2|UG116L006-Q11_3|UG116L006-Q11_4|UG116L006-Q11_5|UG116L006-Q11_6', 'Cuir et textile', 'Laine', 'Laine', 'Matière synthétique', 'Doublure chaude', '', '', '', 'Rond', '', 'Sans lacets', 'Couleur unie', '', '', 4),
('AD543A27R-Q11', 'Terrex Agravic', 'Adidas Performance', 48.95, 'AD543A27R-Q11_1|AD543A27R-Q11_2|AD543A27R-Q11_3|AD543A27R-Q11_4|AD543A27R-Q11_5|AD543A27R-Q11_6', 'Imitation cuir / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh, cuir synthétique', '', 'Randonnée urbaine, alpinisme', 'Rond', 'Plat', '', 'Imprimé', '', 'Respirant', 4),
('AD543A2LM-B11', 'Terrex Trailmaker Mid R RDY K', 'Adidas Performance', 126, 'AD543A2LM-B11_1|AD543A2LM-B11_2|AD543A2LM-B11_3|AD543A2LM-B11_4|AD543A2LM-B11_5|AD543A2LM-B11_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', 'Pluie', 'Randonnée, randonnée urbaine', 'Rond', '', 'Laçage', 'Imprimé', '', 'Imperméable', 4),
('JA443A03P-K13', 'Woodland Texapore', 'Jack Wolfskin', 43.95, 'JA443A03P-K13_1|JA443A03P-K13_2|JA443A03P-K13_3|JA443A03P-K13_4|JA443A03P-K13_5|JA443A03P-K13_6', 'Imitation cuir / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Cuir synthétique', 'Pluie', 'Randonnée, randonnée urbaine', 'Rond', 'Plat', 'Laçage', 'Couleur unie', 'Découpes', 'Respirant, imperméable', 4),
('QS343A002-C11', 'Mescalito Mid Kid GTX Unisex', 'Scarpa', 98.95, 'QS343A002-C11_1|QS343A002-C11_2|QS343A002-C11_3|QS343A002-C11_4|QS343A002-C11_5|QS343A002-C11_6', 'Suède', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', 'Pluie', 'Randonnée, randonnée urbaine', 'Rond', '', 'Laçage', 'Imprimé', '', 'Respirant, imperméable', 4),
('TRI43A002-Q12', 'Kids Trolltunga Hiker Mid Unisex', 'TrollKids', 38.95, 'TRI43A002-Q12_1|TRI43A002-Q12_2|TRI43A002-Q12_3|TRI43A002-Q12_4|TRI43A002-Q12_5|TRI43A002-Q12_6', 'Imitation cuir / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Cuir synthétique', 'Pluie', 'Randonnée', 'Rond', '', 'Laçage', 'Imprimé', '', 'Respirant, imperméable', 4),
('AS143A07H-M14', 'Gel – Noosa TRI 13 Unisex', 'Asics', 74.95, 'AS143A07H-M14_1|AS143A07H-M14_2|AS143A07H-M14_3|AS143A07H-M14_4|AS143A07H-M14_5|AS143A07H-M14_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh', '', 'Running', 'Rond', '', 'Laçage', 'Imprimé', '', 'Respirant', 4),
('JOC43A05W-A11', 'Air 200 Unisex', 'Jordan', 69.95, 'JOC43A05W-A11_1|JOC43A05W-A11_2|JOC43A05W-A11_3|JOC43A05W-A11_4|JOC43A05W-A11_5|JOC43A05W-A11_6', 'Matière synthétique / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Cuir synthétique', '', 'Basket-ball', 'Rond', '', 'Laçage', '', 'Découpes', '', 4),
('N1243A1FA-A11', 'Air Max Plus TN', 'Nike Performance', 182.85, 'N1243A1FA-A11_1|N1243A1FA-A11_2|N1243A1FA-A11_3|N1243A1FA-A11_4', 'Imitation cuir / textile', 'Textile', 'Synthétique', 'Caoutchouc résistant à l''abrasion', 'Non doublé', '', '', 'Basket-ball', 'Rond', '', 'Laçage', '', '', 'Respirant', 4),
('N1243A1AK-Q12', 'Flex Runner 2 GS Unisex', 'Nike Performance', 49.95, 'N1243A1AK-Q12_1|N1243A1AK-Q12_2|N1243A1AK-Q12_3|N1243A1AK-Q12_4|N1243A1AK-Q12_5|N1243A1AK-Q12_6', 'Tissu / matière synthétique', 'Textile', 'Textile', 'Matière synthétique', 'Non doublé', '', '', 'Running', 'Rond', '', 'Sans lacets', 'Imprimé', 'Ganse élastique', '', 4),
('PU143A0MY-K11', 'Solarflash JR II Unisex', 'Puma', 44.95, 'PU143A0MY-K11_1|PU143A0MY-K11_2|PU143A0MY-K11_3|PU143A0MY-K11_4|PU143A0MY-K11_5|PU143A0MY-K11_6', 'Matière synthétique / textile', 'Textile', 'Textile', 'Caoutchouc résistant à l''abrasion', 'Doublure protégeant du froid', '', '', 'Handball, volley-ball', 'Rond', 'Plat', 'Laçage', 'Imprimé', 'Découpes', '', 4),
('CO413D0CA-Q11', 'Chuck Taylor All Star Move Color Pop', 'Converse', 59.95, 'CO413D0CA-Q11_1|CO413D0CA-Q11_2|CO413D0CA-Q11_3|CO413D0CA-Q11_4|CO413D0CA-Q11_5|CO413D0CA-Q11_6|CO413D0CA-Q11_7', 'Textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Toile', '', '', 'Rond', 'Plateforme continue', 'Laçage', '', '', '', 4),
('1FI16D01D-B11', 'Collene Unisex', 'Fila', 59.95, '1FI16D01D-B11_1|1FI16D01D-B11_2|1FI16D01D-B11_3|1FI16D01D-B11_4|1FI16D01D-B11_5|1FI16D01D-B11_6', 'Imitation cuir / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh, cuir synthétique', '', '', 'Rond', '', 'Laçage', 'Multicolor', 'Découpes', '', 4),
('JOC43A07H-A11', 'Air 3 Retro Unisex', 'Jordan', 149.95, 'JOC43A07H-A11_1|JOC43A07H-A11_2|JOC43A07H-A11_3|JOC43A07H-A11_4|JOC43A07H-A11_5|JOC43A07H-A11_6', 'Cuir et imitation de cuir', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', 'Basket-ball', 'Rond', '', 'Laçage', '', 'Découpes', '', 4),
('NE216D05Z-A11', 'PZ530 Unisex', 'New Balance', 69.95, 'NE216D05Z-A11_1|NE216D05Z-A11_2|NE216D05Z-A11_3|NE216D05Z-A11_4|NE216D05Z-A11_5|NE216D05Z-A11_6', 'Imitation cuir / textile', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', 'Mesh, cuir synthétique', '', '', 'Rond', '', 'Laçage', 'Imprimé', '', '', 4),
('NI116D09P-A11', 'Force 1 Unisex', 'Nike Sportswear', 69.95, 'NI116D09P-A11_1|NI116D09P-A11_2|NI116D09P-A11_3|NI116D09P-A11_4|NI116D09P-A11_5|NI116D09P-A11_6|NI116D09P-A11_7', 'Cuir', 'Textile', 'Textile', 'Matière synthétique', 'Doublure protégeant du froid', '', '', '', 'Rond', '', 'Laçage', 'Couleur unie', '', '', 4);

INSERT INTO "categorie" (nom)
VALUES 
('Bottes'),
('Bottines'),
('Chaussures de sport'),
('Escarpins'),
('Sandales'),
('Chaussures de marche'),
('Chaussures de ville'),
('Sneakers'),
('Chaussons'),
('Chaussures de randonnée');

INSERT INTO "produit_categorie" (produit_id, categorie_id)
VALUES 
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 4),
(17, 4),
(18, 4),
(19, 4),
(20, 4),
(21, 5),
(22, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 6),
(27, 6),
(28, 6),
(29, 6),
(30, 6),
(31, 3),
(32, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 7),
(37, 7),
(38, 7),
(39, 7),
(40, 7),
(41, 5),
(42, 5),
(43, 5),
(44, 5),
(45, 5),
(46, 8),
(47, 8),
(48, 8),
(49, 8),
(50, 8),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 9),
(57, 9),
(58, 9),
(59, 9),
(60, 9),
(61, 10),
(62, 10),
(63, 10),
(64, 10),
(65, 10),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 8),
(72, 8),
(73, 8),
(74, 8),
(75, 8);

COMMIT;
