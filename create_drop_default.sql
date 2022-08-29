/* CREATE, DROP e DEFAULT */

CREATE DATABASE jogadores;
CREATE DATABASE IF NOT EXISTS jogadores;

CREATE DATABASE IF NOT EXISTS jogadores DEFAULT CHARACTER SET utf16;	/* UTF16 da tabela ASCII */
CREATE DATABASE IF NOT EXISTS jogadores DEFAULT CHARACTER SET utf8 DEFAULT ENCRYPTION 'Y';

DROP DATABASE jogadores;
DROP DATABASE IF EXISTS jogadores;

SHOW COLLATION;
SHOW CHARACTER SET;
SHOW DATABASES;
SHOW TABLES;