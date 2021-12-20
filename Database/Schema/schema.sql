-- Create table house_data_raw
CREATE TABLE house_data_raw (
    id bigint NOT NULL,
    date date NOT NULL,
    price decimal(10,2) NOT NULL,
    bedrooms int NOT NULL,
    bathrooms int NOT NULL,
    sqft_living int NOT NULL,
    sqft_lot int NOT NULL,
    floors float NOT NULL,
    waterfront int,
    view int NOT NULL,
    condition int NOT NULL,
    grade int NOT NULL,
    sqft_above int NOT NULL,
    sqft_basement int NOT NULL,
    yr_built int NOT NULL,
    yr_renovated int NOT NULL,
    zipcode char(5) NOT NULL,
    lat decimal(6,4),
    long decimal(6,3),
    sqft_living15 int NOT NULL,
    sqft_lot15 int NOT NULL,
    PRIMARY KEY (id)
);


-- Create table house_data_clean
CREATE TABLE house_data_clean (
    id bigint NOT NULL UNIQUE,
    close_date date NOT NULL,
    price decimal(10,2) NOT NULL,
    bedrooms int NOT NULL,
    bathrooms float NOT NULL,
    floors float NOT NULL,
    views int,
    condition int NOT NULL,
    grade int NOT NULL,
    yr_built int NOT NULL,
    yr_renovated int,
    home_size int NOT NULL,
    lot_size int NOT NULL,
    above_size int NOT NULL,
    basement_size int NOT NULL,
    waterfront int,
    zipcode char(5) NOT NULL,
    lat decimal(6,4),
    long decimal(6,3),
    homereno_2015 int,
    lotreno_2015 int,
    PRIMARY KEY (id)
);

-- Add constraint to waterfront column; limiting input to '0' or '1'
ALTER TABLE public.house_data_clean
    ADD CONSTRAINT waterfront_tf_check CHECK (waterfront = '0' OR waterfront = '1');
COMMENT ON CONSTRAINT waterfront_tf_check ON public.house_data_clean
    IS 'Inputs limited to ''0'' (not true) and ''1'' (true)';

-- Create table condition which will have set descriptions linked to database for reference purpose
CREATE TABLE condition (
    condition int NOT NULL UNIQUE,
    description varchar NOT NULL,
    PRIMARY KEY (condition)
);

-- Add foreign key to house_data_clean to connect on condition column with condition table
ALTER TABLE house_data_clean
ADD FOREIGN KEY (condition) REFERENCES condition(condition);

-- Query to join tables and list description of house condition alongside price and year built
SELECT house_data_clean.id, condition.description, house_data_clean.price, yr_built
FROM house_data_clean
INNER JOIN condition
ON house_data_clean.condition=condition.condition;
