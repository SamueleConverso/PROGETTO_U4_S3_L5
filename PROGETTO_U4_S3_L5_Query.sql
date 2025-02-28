CREATE DATABASE PROGETTO_U4_S3_L5;

USE PROGETTO_U4_S3_L5;

CREATE TABLE ANAGRAFICA (
IDAnagrafica INT PRIMARY KEY IDENTITY(1, 1),
Nome VARCHAR(40) NOT NULL, 
Cognome VARCHAR(40) NOT NULL,
Indirizzo VARCHAR(100) NOT NULL,
Citta VARCHAR(40) NOT NULL,
CAP INT NOT NULL,
Cod_Fisc VARCHAR(17) NOT NULL
);

CREATE TABLE TIPO_VIOLAZIONE (
IDViolazione INT PRIMARY KEY IDENTITY (1, 1),
Descrizione VARCHAR(100) NOT NULL
);

CREATE TABLE VERBALE (
IDVerbale INT PRIMARY KEY IDENTITY (1, 1),
DataViolazione DATE NOT NULL,
IndirizzoViolazione VARCHAR(100) NOT NULL,
Nominativo_Agente VARCHAR(80) NOT NULL,
DataTrascrizioneVerbale DATE NOT NULL,
Importo MONEY NOT NULL,
DecurtamentoPunti INT NOT NULL,
IDAnagrafica INT NOT NULL,
CONSTRAINT FK_VERBALE_IDAnagrafica FOREIGN KEY (IDAnagrafica) REFERENCES ANAGRAFICA(IDAnagrafica)
);

CREATE TABLE VERBALE_VIOLAZIONE (
IDVerbaleViolazione INT PRIMARY KEY IDENTITY(1, 1),
IDVerbale INT NOT NULL,
IDViolazione INT NOT NULL,
CONSTRAINT FK_VERBALEVIOLAZIONE_IDVerbale FOREIGN KEY (IDVerbale) REFERENCES VERBALE(IDVerbale),
CONSTRAINT FK_VERBALEVIOLAZIONE_IDViolazione FOREIGN KEY (IDViolazione) REFERENCES TIPO_VIOLAZIONE(IDViolazione)
);

--INSERIMENTI--

INSERT INTO ANAGRAFICA (Nome, Cognome, Indirizzo, Citta, CAP, Cod_Fisc)
VALUES 
('Mario', 'Rossi', 'Via Roma 1', 'Milano', '20121', 'RSSMRA80A01F205Z'),
('Giuseppe', 'Verdi', 'Via Dante 25', 'Roma', '00100', 'VRDGPP75B15H501Y'),
('Anna', 'Bianchi', 'Corso Italia 42', 'Napoli', '80100', 'BNCNNA82C45F839X'),
('Francesco', 'Russo', 'Via Garibaldi 7', 'Torino', '10121', 'RSSFNC78D18L219P'),
('Laura', 'Ferrari', 'Piazza Duomo 3', 'Firenze', '50122', 'FRRLRA85E54D612S'),
('Marco', 'Esposito', 'Via Mazzini 19', 'Bologna', '40121', 'SPSMRC77F23A944T'),
('Giovanna', 'Romano', 'Viale Europa 33', 'Genova', '16121', 'RMNGNN83G62D969U'),
('Paolo', 'Colombo', 'Corso Vittorio 12', 'Palermo', '90100', 'CLMPLA74H28G273V'),
('Francesca', 'Ricci', 'Via Nazionale 5', 'Bari', '70121', 'RCCFNC86I47A662W'),
('Antonio', 'Marino', 'Piazza Cavour 8', 'Catania', '95121', 'MRNNTN79L05C351X'),
('Silvia', 'Greco', 'Via del Corso 22', 'Venezia', '30121', 'GRCSVA84M63L736Y'),
('Roberto', 'Conti', 'Largo Colombo 14', 'Verona', '37121', 'CNTRRT76N30L781Z'),
('Claudia', 'Gallo', 'Via Veneto 31', 'Messina', '98100', 'GLLCLD88P68F158A'),
('Stefano', 'Mancini', 'Corso Umberto 17', 'Padova', '35121', 'MNCSFN75Q27G224B'),
('Elena', 'Costa', 'Via XX Settembre 44', 'Trieste', '34121', 'CSTLNE87R55L424C'),
('Luca', 'Giordano', 'Piazza Garibaldi 6', 'Brescia', '25121', 'GRDLCU73S13B157D'),
('Valentina', 'Rizzo', 'Viale Marconi 29', 'Prato', '59100', 'RZZVNT89T71G999E'),
('Alessandro', 'Lombardi', 'Via Cavour 11', 'Taranto', '74121', 'LMBLSN77U24L049F'),
('Martina', 'Barbieri', 'Corso Garibaldi 37', 'Reggio Calabria', '89100', 'BRBMTN86V62H224G'),
('Davide', 'Fontana', 'Via Diaz 15', 'Modena', '41121', 'FNTDVD78W01F257H'),
('Sara', 'Santoro', 'Piazza Roma 9', 'Livorno', '57100', 'SNTSRA85X43E625I'),
('Andrea', 'Mariani', 'Viale dei Mille 23', 'Parma', '43121', 'MRNNDR74Y27G337J'),
('Sofia', 'Rinaldi', 'Via Po 18', 'Foggia', '71121', 'RNLSFO90A64D643K'),
('Giovanni', 'Caruso', 'Corso Mazzini 26', 'Salerno', '84121', 'CRSGNN76B19H703L'),
('Giulia', 'Ferraro', 'Via Emilia 39', 'Palermo', '06121', 'FRRGLI88C51G478M'),
('Matteo', 'Pagano', 'Piazza Dante 7', 'Rimini', '47921', 'PGNMTT79D13H294N'),
('Chiara', 'De Luca', 'Viale Regina 16', 'Ferrara', '44121', 'DLCCHR87E69D548O'),
('Simone', 'Fabbri', 'Via Firenze 24', 'Sassari', '07100', 'FBBSMN75F29I452P'),
('Elisa', 'Moretti', 'Corso Cavour 32', 'Palermo', '20900', 'MRTLSE89G58F704Q'),
('Daniele', 'Pellegrini', 'Piazza Verdi 13', 'Bergamo', '24121', 'PLLDNL80H14A794R');

INSERT INTO TIPO_VIOLAZIONE (Descrizione)
VALUES 
('Eccesso di velocità oltre 40 km/h'),
('Guida in stato di ebbrezza'),
('Passaggio con semaforo rosso'),
('Sosta in divieto di fermata'),
('Utilizzo del cellulare durante la guida'),
('Mancato uso delle cinture di sicurezza'),
('Guida contromano'),
('Mancata precedenza'),
('Sorpasso in curva o dosso'),
('Guida senza patente');

INSERT INTO VERBALE (DataViolazione, IndirizzoViolazione, Nominativo_Agente, DataTrascrizioneVerbale, Importo, DecurtamentoPunti, IDAnagrafica)
VALUES 

('2023-02-15', 'Via Roma 123', 'Mario Bianchi', '2023-02-16', 250.00, 4, 1),
('2023-05-22', 'Corso Italia 45', 'Luigi Verdi', '2023-05-23', 180.00, 3, 1),
('2023-09-10', 'Viale Europa 67', 'Sara Neri', '2023-09-11', 320.00, 5, 1),

('2023-03-05', 'Via Garibaldi 22', 'Paolo Rossi', '2023-03-06', 150.00, 2, 2),
('2023-11-18', 'Piazza Duomo 8', 'Anna Verdi', '2023-11-19', 220.00, 3, 2),

('2009-02-01', 'Via Nazionale 56', 'Marco Bruni', '2009-02-02', 280.00, 4, 3),
('2009-03-01', 'Corso Umberto 78', 'Laura Bianchi', '2009-03-02', 190.00, 2, 3),

('2023-04-15', 'Via Dante 33', 'Laura Bianchi', '2023-04-16', 510.00, 3, 4),
('2023-07-08', 'Viale Marconi 12', 'Giulia Romano', '2023-07-09', 170.00, 2, 5),
('2023-08-22', 'Via XX Settembre 41', 'Andrea Marini', '2023-08-23', 300.00, 5, 6),
('2023-10-03', 'Piazza Venezia 9', 'Sofia Ricci', '2023-10-04', 240.00, 4, 7),
('2023-12-12', 'Viale delle Rose 15', 'Luca Fontana', '2023-12-13', 260.00, 3, 8),
('2023-01-25', 'Via Firenze 29', 'Antonio Ricci', '2023-01-26', 180.00, 2, 9),
('2023-05-05', 'Corso Francia 18', 'Giovanni Russo', '2023-05-06', 230.00, 4, 10),

('2009-04-01', 'Via Veneto 37', 'Martina Ferraro', '2009-04-02', 290.00, 5, 11),
('2023-07-19', 'Piazza del Popolo 5', 'Davide Esposito', '2023-07-20', 200.00, 3, 11),
('2023-03-17', 'Corso Vittorio 25', 'Laura Bianchi', '2023-03-18', 270.00, 4, 12),
('2023-09-25', 'Via della Libertà 14', 'Simone Marino', '2023-09-26', 160.00, 2, 12),
('2023-04-09', 'Viale dei Tigli 31', 'Chiara Gallo', '2023-04-10', 310.00, 5, 13),
('2023-11-11', 'Piazza Maggiore 7', 'Alessandro Conti', '2023-11-12', 220.00, 3, 13),
('2023-06-13', 'Via Emilia 23', 'Valentina Costa', '2023-06-14', 250.00, 4, 14),
('2023-12-27', 'Corso Mazzini 19', 'Matteo Santoro', '2023-12-28', 190.00, 2, 14),
('2023-01-31', 'Via Po 42', 'Sara Lombardi', '2023-02-01', 280.00, 7, 15),
('2023-08-14', 'Piazza San Marco 10', 'Andrea Barbieri', '2023-08-15', 240.00, 4, 15),

('2009-05-01', 'Viale Gorizia 27', 'Valentina Costa', '2009-05-02 14:10:00', 200.00, 3, 16),
('2023-09-02', 'Via dei Mille 35', 'Marco Rinaldi', '2023-09-03 10:25:00', 170.00, 2, 17),
('2023-05-17', 'Corso Garibaldi 16', 'Laura Pagano', '2023-05-18 13:15:00', 320.00, 6, 18),
('2023-10-28', 'Piazza della Libertà 8', 'Paolo De Luca', '2023-10-29 15:50:00', 260.00, 4, 19),
('2023-12-05', 'Via Napoli 22', 'Anna Fabbri', '2023-12-06 08:35:00', 210.00, 3, 20),

('2023-02-28', 'Viale Michelangelo 11', 'Roberto Moretti', '2023-03-01', 290.00, 5, 21),
('2023-06-22', 'Piazza Navona 3', 'Silvia Pellegrini', '2023-06-23', 180.00, 2, 21),
('2023-04-05', 'Corso Cavour 29', 'Antonio Ricci', '2023-04-06', 250.00, 4, 22),
('2023-11-03', 'Via Torino 47', 'Elena Ferraro', '2023-11-04', 200.00, 3, 22),
('2023-01-19', 'Viale Vittorio Veneto 13', 'Antonio Ricci', '2023-01-20', 270.00, 5, 23),
('2023-07-31', 'Piazza dei Martiri 6', 'Antonio Ricci', '2023-08-01', 230.00, 4, 23),
('2023-05-12', 'Via Leonardo da Vinci 38', 'Antonio Ricci', '2023-05-13', 190.00, 3, 24),
('2023-10-17', 'Corso Buenos Aires 21', 'Giovanni Mancini', '2023-10-18', 740.00, 6, 24),
('2023-03-29', 'Via Bologna 17', 'Martina Russo', '2023-03-30', 220.00, 3, 25),
('2023-08-08', 'Piazza Castello 9', 'Luca Bianchi', '2023-08-09', 280.00, 5, 25);

INSERT INTO VERBALE_VIOLAZIONE (IDVerbale, IDViolazione)
VALUES

(1, 1),

(2, 3),
(2, 6),

(3, 2),
(3, 5),
(3, 9),

(4, 4),

(5, 7),
(5, 8),

(6, 10),
(7, 1),
(8, 3),
(9, 5),
(10, 2),

(11, 4),
(11, 6),
(12, 9),
(12, 10),
(13, 1),
(13, 7),
(14, 3),
(14, 8),
(15, 2),
(15, 5),

(16, 6),
(17, 4),
(18, 9),
(19, 1),
(20, 10),

(21, 2), 
(22, 3), 
(22, 5), 
(23, 7),
(23, 8),
(23, 9),
(24, 1),
(25, 4),
(25, 6), 

(26, 10),
(27, 2),
(28, 4),
(29, 8),
(30, 5),

(31, 1), 
(32, 3),
(32, 9), 
(33, 5),
(33, 7),
(33, 10),
(34, 2),
(35, 6),
(35, 8), 

(36, 4),
(37, 1),
(38, 7),
(39, 9)

--1
SELECT COUNT(*) TotVerbali FROM VERBALE;

--2
SELECT 
Nome,
Cognome,
ANAGRAFICA.IDAnagrafica,
COUNT(IDVerbale) AS TotVerbali
FROM 
ANAGRAFICA
LEFT JOIN 
VERBALE ON 
ANAGRAFICA.IDAnagrafica = VERBALE.IDAnagrafica
GROUP BY 
ANAGRAFICA.IDAnagrafica, ANAGRAFICA.Nome, ANAGRAFICA.Cognome;

--3
SELECT 
Descrizione,
COUNT(IDVerbale) AS TotVerbali
FROM 
TIPO_VIOLAZIONE
JOIN 
VERBALE_VIOLAZIONE ON 
TIPO_VIOLAZIONE.IDViolazione = VERBALE_VIOLAZIONE.IDViolazione
GROUP BY 
Descrizione;

--4
SELECT 
ANAGRAFICA.IDAnagrafica,
Nome,
Cognome,
SUM(DecurtamentoPunti) AS TotPuntiDecurtati
FROM 
ANAGRAFICA
INNER JOIN 
VERBALE ON ANAGRAFICA.IDAnagrafica = VERBALE.IDAnagrafica
GROUP BY 
ANAGRAFICA.IDAnagrafica, Nome, Cognome;

--5
SELECT
Nome, Cognome, DataViolazione, IndirizzoViolazione, Importo, DecurtamentoPunti
FROM
ANAGRAFICA
INNER JOIN
VERBALE ON
ANAGRAFICA.IDAnagrafica = VERBALE.IDAnagrafica
WHERE Citta = 'Palermo'

--6
SELECT
Nome, Cognome, DataViolazione, Indirizzo, Importo, DecurtamentoPunti
FROM
ANAGRAFICA
INNER JOIN
VERBALE ON
ANAGRAFICA.IDAnagrafica = VERBALE.IDAnagrafica
WHERE DataViolazione BETWEEN '2009-02-01' AND '2009-07-30'

--7
SELECT
ANAGRAFICA.IDAnagrafica, Nome, Cognome, SUM(Importo) AS TotImporto
FROM
ANAGRAFICA
INNER JOIN
VERBALE ON
ANAGRAFICA.IDAnagrafica = VERBALE.IDAnagrafica
GROUP BY
ANAGRAFICA.IDAnagrafica, Nome, Cognome

--8
SELECT * FROM ANAGRAFICA WHERE Citta = 'Palermo';

--9
SELECT DataViolazione, Importo, DecurtamentoPunti FROM VERBALE WHERE DataViolazione = '2009-02-01';

--10
SELECT
Nominativo_Agente,
COUNT(IDViolazione) as TotViolazioni
FROM
VERBALE
INNER JOIN
VERBALE_VIOLAZIONE ON
VERBALE.IDVerbale = VERBALE_VIOLAZIONE.IDVerbale
GROUP BY
VERBALE.Nominativo_Agente

--11
SELECT
Nome, Cognome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti
FROM
ANAGRAFICA
INNER JOIN
VERBALE ON
ANAGRAFICA.IDAnagrafica = VERBALE.IDAnagrafica
WHERE DecurtamentoPunti > 5

--12
SELECT
Nome, Cognome, Indirizzo, DataViolazione, Importo, DecurtamentoPunti
FROM
ANAGRAFICA
INNER JOIN
VERBALE ON
ANAGRAFICA.IDAnagrafica = VERBALE.IDAnagrafica
WHERE Importo > 400

--13 (extra)
SELECT Nominativo_Agente, COUNT(IDVerbale) AS TotVerbali, SUM(Importo) AS TotImporto FROM VERBALE GROUP BY Nominativo_Agente;

--14 (extra)
SELECT
IDViolazione,
AVG(Importo) AS MediaImporto
FROM
VERBALE
INNER JOIN
VERBALE_VIOLAZIONE ON
VERBALE.IDVerbale = VERBALE_VIOLAZIONE.IDVerbale
GROUP BY IDViolazione