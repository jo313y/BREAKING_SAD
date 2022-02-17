-- full table
CREATE TABLE full_table (
  beer_ABV FLOAT,	
  beer_beerId INT,
  beer_brewerId INT,
  beer_name TEXT,
  beer_style TEXT,
  review_appearance FLOAT,
  review_palette FLOAT,
  review_overall FLOAT,
  review_taste FLOAT,
  review_profileName TEXT,
  review_aroma FLOAT
);

-- review table
CREATE TABLE review_table (
  beer_beerId INT,
  review_appearance FLOAT,
  review_palette FLOAT,
  review_overall FLOAT,
  review_taste FLOAT,
  review_profileName TEXT,
  review_aroma FLOAT
);
