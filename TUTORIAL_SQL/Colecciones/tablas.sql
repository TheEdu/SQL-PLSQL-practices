create table EDU_TEST_AUTO_TANSC(
    at_id NUMBER NOT NULL PRIMARY KEY,
    at_desc VARCHAR2(50)
);


CREATE TABLE EDU_LOG_TABLE(
  log_id NUMBER NOT NULL PRIMARY KEY,
  log_at_id NUMBER,
  log_msg VARCHAR2(400),
  log_inset_time DATE
);

 
CREATE TABLE EDU_ITEMS(
  item_id NUMBER PRIMARY KEY NOT NULL,
  item_name VARCHAR2(60),
  item_value NUMBER(5,2)
);

CREATE TABLE EDU_CUSTOMERS(
  cust_id NUMBER PRIMARY KEY NOT NULL,
  cust_name VARCHAR2(100),
  cust_location VARCHAR(2)
);

CREATE TABLE EDU_ACCOUNTS(
  act_id NUMBER PRIMARY KEY NOT NULL,
  act_cust_id NUMBER,
  act_bal NUMBER(10,2)
);

ALTER TABLE EDU_ACCOUNTS
  ADD CONSTRAINT
  fk_act_cust_id FOREIGN KEY(act_cust_id)
  REFERENCES EDU_CUSTOMERS(cust_id);
  

CREATE TABLE EDU_ORDERS(
  order_id NUMBER PRIMARY KEY NOT NULL,
  order_item_id NUMBER,
  order_act_id NUMBER
);


ALTER TABLE EDU_ORDERS
  ADD CONSTRAINT
  fk_order_item_id FOREIGN KEY(order_item_id)
  REFERENCES EDU_ITEMS(item_id);
  
  
ALTER TABLE EDU_ORDERS
  ADD CONSTRAINT
  fk_order_act_id FOREIGN KEY(order_act_id)
  REFERENCES EDU_ACCOUNTS(act_id);
  
  
INSERT ALL
  INTO XXLINK.EDU_ITEMS(item_id, item_name, item_value) VALUES (1,'Pelota',34.50)
  INTO XXLINK.EDU_ITEMS(item_id, item_name, item_value) VALUES (2,'Pandereta',20)
  INTO XXLINK.EDU_ITEMS(item_id, item_name, item_value) VALUES (3,'Titere',11.99)
SELECT * FROM dual;
COMMIT;
SELECT * FROM XXLINK.EDU_ITEMS;

