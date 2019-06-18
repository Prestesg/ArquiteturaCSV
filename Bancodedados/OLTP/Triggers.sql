#INSERE NOVO REGISTRO NA DIMENSÃO EMOCAO DA BASE DE ANALISE DE NOTAS
DELIMITER $
CREATE TRIGGER NovaEmocaoDIM AFTER INSERT
ON baseoltpexperimentoocr.Emocoes
FOR EACH ROW
BEGIN
INSERT INTO baseolapexperimentoocrnotas.Emocoes (ID,Nome) VALUES (NEW.ID,NEW.Nome);
END$

#INSERE NOVO REGISTRO NA DIMENSÃO IMAGEM DA BASE DE ANALISE DE NOTAS
DELIMITER $
CREATE TRIGGER NovaImagemDIM AFTER INSERT
ON baseoltpexperimentoocr.Imagens
FOR EACH ROW
BEGIN
INSERT INTO baseolapexperimentoocrnotas.Imagens (ID,Link) VALUES (NEW.ID,NEW.Link);
END$

#INSERE NOVO REGISTRO NA DIMENSÃO USUARIO DA BASE DE ANALISE DE NOTAS
DELIMITER $
CREATE TRIGGER NovoUsuarioDIM AFTER INSERT
ON baseoltpexperimentoocr.Usuario
FOR EACH ROW
BEGIN
INSERT INTO baseolapexperimentoocrnotas.Usuario (ID,Nome,Email) VALUES (NEW.ID,NEW.Nome,NEW.Email);
END$

#INSERE NOVO REGISTRO NA DIMENSÃO TEXTO DA BASE DE ANALISE DE NOTAS
DELIMITER $
CREATE TRIGGER NovoTextoDIM AFTER INSERT
ON baseoltpexperimentoocr.Imagens_Texto
FOR EACH ROW
BEGIN
INSERT INTO baseolapexperimentoocrnotas.Texto (ID,Texto) VALUES (NEW.ID,NEW.Texto);
END$

#INSERE NOVO REGISTRO NO FATO DA BASE DE ANALISE DE NOTAS (NÃO TERMINADA)
DELIMITER $
CREATE TRIGGER NovaAvaliacaoTexto AFTER INSERT
ON Avaliacao_Texto
FOR EACH ROW
BEGIN
INSERT INTO baseolapexperimentoocrnotas.Imagem_Notas (IDAvaliacao,Nota_Texto) VALUES (NEW.ID,NEW.NOTA);
END$