CREATE TABLE SERVICES
(
    SERVICE_ID BIGSERIAL PRIMARY KEY,
    NAME       VARCHAR UNIQUE,
    PRICE      NUMERIC(12, 2)
);

CREATE TABLE CUSTOMERS
(
    CUSTOMER_ID BIGSERIAL PRIMARY KEY,
    FIRST_NAME  VARCHAR,
    LAST_NAME   VARCHAR,
    EMAIL       VARCHAR,
    PHONE       VARCHAR,
    ADDRESS     VARCHAR
);

CREATE TABLE VENDORS
(
    VENDOR_ID BIGSERIAL PRIMARY KEY,
    NAME      VARCHAR NOT NULL,
    CONTACT   VARCHAR,
    PHONE     VARCHAR,
    EMAIL     VARCHAR,
    ADDRESS   VARCHAR
);

CREATE TABLE PRODUCTS
(
    PRODUCT_ID BIGSERIAL PRIMARY KEY,
    NAME       VARCHAR UNIQUE,
    PRICE      NUMERIC(12, 2),
    VENDOR_ID  BIGINT NOT NULL,
    FOREIGN KEY (VENDOR_ID) REFERENCES VENDORS (VENDOR_ID)
);
