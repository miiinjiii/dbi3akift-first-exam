-- eine View ist eine Darstellung über begrenzten Datensätze

-- Mit der View kann ich bestimmen welche Daten gesehen werden dürfen und welche nicht.
-- die View an sich ist nur lesbar aber nicht schreibbar
-- wir könnten spalten wir zB id, update_at, und status weglassen und somti die View übersichtlicher zu machen

CREATE VIEW IF NOT EXISTS conversations_incoming AS 
SELECT c.id, c.first_name, c.last_name, 
    (SELECT SUM(id) 
    FROM conversations conv
    WHERE conv.contact_id = c.id AND conv.last_message_direction = 'incoming') AS total_income
FROM contacts c;

CREATE VIEW IF NOT EXISTS conversations_v AS
SELECT c.id, c.first_name, c.last_name, 
(SELECT SUM(id) 
FROM conversations conv 
JOIN accounts a ON a.id = conv.account_id
WHERE conv.contact_id = c.id AND a.id = conv.account_id;),
MAX(SELECT msg.sent_at 
FROM message msg 
JOIN conversations conv ON msg.account_id = conv.account_id
WHERE msg.account_id = c.id
AND msg.last_message_direction = 'incoming';) AS last_incoming,
MAX(SELECT msg.sent_at 
FROM message msg 
JOIN conversations conv ON msg.account_id = conv.account_id
WHERE msg.account_id = c.id
AND msg.last_message_direction = 'outgoing';) AS last_outgoing
FROM contacts c
GROUP BY c.id;