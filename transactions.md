Die View kann sehr schnell komplex werden und wenn sich in den Haupttabellen etwas ändert an den Spalten dann ist die View kaputt. 

Manche Verarbeitungschritte könnten sich überschneiden und fehlerhafte Datensätze bilden. 

Wenn eine Email nicht abgeschlossen wird könnte sie zB bei dem Sender pending sein und bei dem Empfänger nie ankommen. Sobald sie "sent" ist bekommt der Empfänger die Email als "recieved".


Eine Transcation bearbeitet mehrer Tabellen die mit eine Aktion sich ändern sie arbeite mit dem ACID-Prinzip. Dabei sollen keine Daten-Fehler passieren.

SELECT add.email, c.first_name, c.lastname
FROM addresses add
JOIN contacts c ON c.id = add.contact_id
GROUP BY id; 

SELECT COUNT(id)
FROM connverstaion
WHERE 

BEGIN Transaktion;

hier kommt alles ein

COMMIT;


