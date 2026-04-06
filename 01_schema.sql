
CREATE TABLE Customer (
    customer_id   NUMBER(6)      PRIMARY KEY,
    customer_name          VARCHAR2(100)  NOT NULL,
    email         VARCHAR2(150)  UNIQUE NOT NULL,
    city          VARCHAR2(50)   NOT NULL,
    signupdate   DATE           DEFAULT SYSDATE
);


CREATE TABLE Product (
    product_id    NUMBER(6)      PRIMARY KEY,
    customer_name         VARCHAR2(150)  NOT NULL,
    category      VARCHAR2(50)   NOT NULL,
    price         NUMBER(10,2)   NOT NULL CHECK (price > 0),
    stock_qy    NUMBER(6)      DEFAULT 0
);


CREATE TABLE Orders (
    order_id      NUMBER(8)      PRIMARY KEY,
    customer_id   NUMBER(6)      NOT NULL,
    order_date    DATE           NOT NULL,
    status        VARCHAR2(20)   DEFAULT 'placed'
                                 CHECK (status IN ('placed','shipped','delivered','cancelled')),
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id)
        REFERENCES Customer(customer_id)
);


CREATE TABLE Order_Item (
    item_id       NUMBER(10)     PRIMARY KEY,
    order_id      NUMBER(8)      NOT NULL,
    product_id    NUMBER(6)      NOT NULL,
    quantity      NUMBER(4)      NOT NULL CHECK (quantity > 0),
    unitprice    NUMBER(10,2)   NOT NULL,   
    CONSTRAINT fk_item_order   FOREIGN KEY (order_id)   REFERENCES Orders(order_id),
    CONSTRAINT fk_item_product FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Indexes for performance on frequently joined/filtered columns
CREATE INDEX ix_order_customer   ON Orders(customer_id);
CREATE INDEX ix_order_date       ON Orders(order_date);
CREATE INDEX ix_item_order       ON Order_Item(order_id);
CREATE INDEX ix_item_product     ON Order_Item(product_id);
CREATE INDEX ix_product_category ON Product(category);
