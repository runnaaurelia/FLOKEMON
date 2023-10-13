-- Final Project Intro DB Lab
-- GROUP 5:
-- 2502036003 - Kelly
-- 2502039926 - Maura Pramesti Prasetyo
-- 2502040190 - Muhammad Julian
-- 2540135220 - Runna Aurelia

-- Insert Data

INSERT INTO Staff VALUES
('ST001' , 'Julian Wijaya', 'julianwjy@jwlbx.com', '081386961893', 'Male', '5000000'),
('ST002' , 'Wendy Lim', 'wendylim@yslim.com', '081389963093', 'Female', '4800000'),
('ST003' , 'Vincent Susanto', 'vincentsusanto@yvfs.com', '08828853477893', 'Male', '4500000'),
('ST004' , 'Danny Shelby', 'danshelby@shbly.com', '081254551194', 'Male', '5200000'),
('ST005' , 'Gabriela Scarf', 'gabscarf@scrf.com', '085316601908', 'Female', '5000000'),
('ST006' , 'Xavier Drewson', 'xavierdrewson@tsfl.com', '081356861893', 'Male', '5400000'),
('ST007' , 'Jean Grey', 'jeangrey@gmhtl.com', '085689968878', 'Female', '4500000'),
('ST008' , 'Alex Summers', 'alexsummers@msfd.com', '081388996876', 'Male', '5000000'),
('ST009' , 'Aaron Lensheer', 'aaromlensheer@ghfv.com', '083377658223', 'Male', '4800000'),
('ST010' , 'Jonathan Franz', 'jonathanfranz@ghkfl.com', '081384967857', 'Male', '5500000')

INSERT INTO Customer VALUES 
('CU001', 'Budi Santoso', '081324546776', 'Male',  'Budi27@gmail.com'),
('CU002', 'Kirana Cantika', '083457868990', 'Female', 'Kirana@gmail.com'),
('CU003', 'Putri Salmawati', '082345445678', 'Female', 'Putrisalma@gmail.com'),
('CU004', 'Yogi Syahputra', '081310656038', 'Male', 'Yogi@gmail.com'),
('CU005', 'Malika Cika', '089290312445', 'Female', 'Malikacika@gmail.com'),
('CU006', 'Zalfa Rabbani', '081217298789', 'Male', 'Zalperabb@gmail.com'),
('CU007', 'Dila Latifah', '081327616734', 'Female', 'Dilalatifah@gmail.com'),
('CU008', 'Monica Sriyani', '081213347867', 'Female', 'Monicasriyani@gmail.com'),
('CU009', 'Malik Firmansyah', '081218029004', 'Male', 'Firmansyah@gmail.com'),
('CU010', 'Kemas Ramadhan', '081317276167', 'Male', 'Kemas122@gmail.com')

INSERT INTO Supplier VALUES
('SU001', 'Toni Soraya', 'tonisoraya@gmail.com', '087654432123'),
('SU002', 'Irfan Salahudin', 'irfanscbd@gmail.com', '089987765432'),
('SU003', 'Wulan Pratiwi', 'wulanpratiwi@gmail.com', '085543321234'),
('SU004', 'Fitria Elma Lestari', 'fitria123@gmail.com', '082398765423'),
('SU005', 'Galak Prasasta Wiranto', 'akugalak@gmail.com', '081223344556'),
('SU006', 'Leo Winarno', 'leowinarno@gmail.com', '086623356798'),
('SU007', 'Makara Prasetya', 'makarapras@gmail.com', '086675543212'),
('SU008', 'Cintya Safitri Melani', 'cintasaf@gmail.com', '08988776654'),
('SU009', 'Zahra Susanti', 'zahrasusan@gmail.com', '086543298712'),
('SU010', 'Yessi Melani', 'yesmelani@gmail.com', '088967734512')

INSERT INTO FlokemonType VALUES
('FT001', 'Psychic'),
('FT002', 'Normal'),
('FT003', 'Fairy'),
('FT004', 'Water'),
('FT005', 'Ice'),
('FT006', 'Fire'),
('FT007', 'Grass'),
('FT008', 'Rock'),
('FT009', 'Electric'),
('FT010', 'Poison')

INSERT INTO Flokemon VALUES
('FL001', 'FT010', 'Butterfree', 1250, 70000),
('FL002', 'FT002', 'Eeveer', 110, 40000),
('FL003', 'FT006', 'Flareon', 400, 85000),
('FL004', 'FT004', 'Gyarados', 643, 250000),
('FL005', 'FT009', 'Pikachu', 750, 280000),
('FL006', 'FT001', 'Lugiar', 1326, 264000),
('FL007', 'FT005', 'Mamoswine', 850, 340000),
('FL008', 'FT001', 'Gardevoir', 1035, 295000),
('FL009', 'FT008', 'Archeops', 570, 190000),
('FL010', 'FT007', 'Bulbasaur', 670, 257000)

INSERT INTO PurchaseTransaction VALUES
('PU001', 'SU001', 'ST002', '2018-03-07'),
('PU002', 'SU004', 'ST008', '2017-02-11'),
('PU003', 'SU006', 'ST009', '2017-08-23'),
('PU004', 'SU003', 'ST007', '2018-02-08'),
('PU005', 'SU005', 'ST003', '2018-10-26'),
('PU006', 'SU008', 'ST006', '2017-06-09'),
('PU007', 'SU001', 'ST005', '2020-11-15'),
('PU008', 'SU009', 'ST002', '2018-01-30'),
('PU009', 'SU002', 'ST003', '2017-06-02'),
('PU010', 'SU007', 'ST009', '2018-03-17'),
('PU011', 'SU010', 'ST001', '2018-04-24'),
('PU012', 'SU004', 'ST010', '2018-01-19'),
('PU013', 'SU009', 'ST004', '2018-05-12'),
('PU014', 'SU001', 'ST007', '2020-05-04'),
('PU015', 'SU008', 'ST003', '2020-03-28')

INSERT INTO PurchaseTransactionDetail VALUES
('PU001', 'FL003', 6),
('PU001', 'FL008', 4),
('PU002', 'FL002', 3),
('PU002', 'FL005', 7),
('PU003', 'FL008', 2),
('PU003', 'FL003', 3),
('PU004', 'FL009', 7),
('PU004', 'FL006', 6),
('PU005', 'FL003', 2),
('PU005', 'FL007', 10),
('PU006', 'FL008', 9),
('PU006', 'FL004', 7),
('PU007', 'FL004', 2),
('PU007', 'FL009', 5),
('PU008', 'FL010', 3),
('PU008', 'FL002', 2),
('PU009', 'FL001', 4),
('PU009', 'FL005', 8),
('PU010', 'FL001', 7),
('PU010', 'FL008', 5),
('PU011', 'FL003', 6),
('PU011', 'FL006', 4),
('PU012', 'FL010', 3),
('PU012', 'FL008', 7),
('PU013', 'FL007', 6),
('PU013', 'FL009', 3),
('PU014', 'FL004', 9),
('PU014', 'FL003', 11),
('PU015', 'FL006', 2),
('PU015', 'FL007', 7)

INSERT INTO SalesTransaction VALUES
('SA001', 'ST002', 'CU009', '2018-04-19'),
('SA002', 'ST005', 'CU001', '2020-12-24'),
('SA003', 'ST004', 'CU008', '2020-10-09'),
('SA004', 'ST001', 'CU005', '2020-03-18'),
('SA005', 'ST002', 'CU001', '2020-11-03'),
('SA006', 'ST009', 'CU003', '2018-09-11'),
('SA007', 'ST010', 'CU003', '2018-07-08'),
('SA008', 'ST001', 'CU010', '2019-02-03'),
('SA009', 'ST002', 'CU009', '2018-11-27'),
('SA010', 'ST003', 'CU002', '2020-12-06'),
('SA011', 'ST004', 'CU007', '2020-07-16'),
('SA012', 'ST006', 'CU004', '2020-01-12'),
('SA013', 'ST005', 'CU006', '2019-04-08'),
('SA014', 'ST010', 'CU007', '2020-01-30'),
('SA015', 'ST007', 'CU002', '2018-04-15')

INSERT INTO SalesTransactionDetail VALUES
('SA001', 'FL002', 12),
('SA001', 'FL005', 3),
('SA002', 'FL003', 8),
('SA002', 'FL009', 4),
('SA003', 'FL002', 10),
('SA003', 'FL010', 2),
('SA004', 'FL009', 5),
('SA004', 'FL006', 4),
('SA005', 'FL008', 3),
('SA005', 'FL010', 3),
('SA006', 'FL005', 6),
('SA006', 'FL007', 2),
('SA007', 'FL001', 10),
('SA007', 'FL004', 5),
('SA008', 'FL006', 3),
('SA008', 'FL001', 14),
('SA009', 'FL008', 2),
('SA009', 'FL010', 5),
('SA010', 'FL007', 6),
('SA010', 'FL003', 7),
('SA011', 'FL009', 9),
('SA011', 'FL002', 8),
('SA012', 'FL004', 4),
('SA012', 'FL006', 3),
('SA013', 'FL008', 5),
('SA013', 'FL005', 6),
('SA014', 'FL001', 11),
('SA014', 'FL007', 2),
('SA015', 'FL010', 3),
('SA015', 'FL003', 8)