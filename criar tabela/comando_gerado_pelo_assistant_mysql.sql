CREATE TABLE `vendas_suco`.`cliente` (
  `cpf` VARCHAR(11) NOT NULL,
  `NOME` VARCHAR(100) NULL,
  `ENDERECO` VARCHAR(150) NULL,
  `BAIRRO` VARCHAR(50) NULL,
  `CIDADE` VARCHAR(50) NULL,
  `ESTADO` VARCHAR(50) NULL,
  `CEP` VARCHAR(8) NULL,
  `DATA_NASCIMENTO` DATE NULL,
  `IDADE` INT NULL,
  `SEXO` VARCHAR(1) NULL,
  `LIMITE_CREDITO` FLOAT NULL,
  `VOLUME_CREDITO` FLOAT NULL,
  `PRIMEIRA_COMPRA` BIT(1) NULL,
  PRIMARY KEY (`cpf`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;