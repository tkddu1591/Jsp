SELECT * FROM jboard.terms;
INSERT INTO jboard.product (type, pName, price, delivery, stock,  thumb1, thumb2, thumb3, seller, etc, rDate)
																			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())