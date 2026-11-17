-- ein Index ist ein B-Baum der schneller und effizienter durch die Table geht als ein full-table scan. 
-- durch den B-Baum geht er logisch durch die Optionen durch und kommt somit schneller zu dem gewünschtem Ziel.
-- Er braucht Speicher also sollte er sinnvoll genutzt werden.

-- In unserer DB könnte man bei folgenden Spalte einen Index setzen:
-- mimetype Annahme es mimetype sind die datentypen zB PDF, CSV etc.
-- tag(name), könnten oft abgefragt werden, Annahme: Tag sind zB Important
-- message(created_at), könnte auch oft abgefragt werden wenn mann abfragt an welchem Tag was geschickt wurden in der INBOX zB

CREATE INDEX  idx_mimetype ON attachments(mimetype);

CREATE INDEX idx_tag_name ON tags(name);
