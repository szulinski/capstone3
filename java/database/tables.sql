BEGIN TRANSACTION;
DROP TABLE IF EXISTS meal_recipe;
DROP TABLE IF EXISTS user_recipe;
DROP TABLE IF EXISTS user_plan;
DROP TABLE IF EXISTS meal_plan;
DROP TABLE IF EXISTS meals;
DROP TABLE IF EXISTS plans;
DROP TABLE IF EXISTS recipes;



DROP SEQUENCE IF EXISTS seq_recipe_id;

CREATE SEQUENCE seq_recipe_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE;

CREATE TABLE recipes (
	recipe_id int DEFAULT nextval('seq_recipe_id'::regclass) NOT NULL,
	recipe_name varchar (75) NOT NULL,
	ingredients varchar (2000) NOT NULL,
	directions varchar (3000) NOT NULL,
	calories int,
	is_low_fat boolean, 
	is_high_protien boolean,
	is_low_carb boolean,
	is_low_sodium boolean,
	CONSTRAINT pk_recipe_id PRIMARY KEY (recipe_id)
	);

DROP SEQUENCE IF EXISTS seq_meal_id;

CREATE SEQUENCE seq_meal_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

CREATE TABLE meals(
	meal_id int NOT NULL,
	recipe_id int NOT NULL,
	type_of_meal varchar(20),
	meal_date date NOT NULL,
	CONSTRAINT pk_meal_id PRIMARY KEY (meal_id),
	CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
	);
	
	

DROP SEQUENCE IF EXISTS seq_plan_id;

CREATE SEQUENCE seq_plan_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
CREATE TABLE plans(
	plan_id int NOT NULL,
	plan_name varchar (100),
	CONSTRAINT pk_plan_id PRIMARY KEY (plan_id)
	);
	

CREATE TABLE meal_plan (
	plan_id int NOT NULL,
	meal_id int NOT NULL,
	CONSTRAINT fk_plan_id FOREIGN KEY (plan_id) REFERENCES plans(plan_id),
	CONSTRAINT fk_meal_id FOREIGN KEY (meal_id) REFERENCES meals(meal_id)
	);
	

CREATE TABLE user_plan (
	user_id int NOT NULL,
	plan_id int NOT NULL,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_plan_id FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
	);
	

CREATE TABLE user_recipe (
	user_id int NOT NULL,
	recipe_id int NOT NULL,
	CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(user_id),
	CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
	);
	
CREATE TABLE meal_recipe (
	meal_id int NOT NULL,
	recipe_id int NOT NULL,
	CONSTRAINT fk_meal_id FOREIGN KEY (meal_id) REFERENCES meals(meal_id),
	CONSTRAINT fk_recipe_id FOREIGN KEY (recipe_id) REFERENCES recipes(recipe_id)
	);
	
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protien, is_low_carb, is_low_sodium) VALUES ('Chicken Vesuvio', 
		  '1/2 cup olive oil, 5 cloves garlic peeled, 2 large russet potatoes, peeled and cut into chunks, 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs, 3/4 cup white wine, 3/4 cup chicken stock,  3 tablespoons chopped parsley, 1 tablespoon dried oregano, Salt and pepper, 1 cup frozen peas, thawed',
		  '1,Heat an oven to 325°F. In a roasting pan (or a large (14-inch) oven-proof skillet), heat the olive oil over medium until shimmering. Add the potatoes and garlic and cook until golden brown, about 12 minutes. Remove to a plate, leaving behind as much oil as possible. 2,Add the chicken to the skillet, skin-side down. Cook until golden and crisp, then turn and cook the other side until golden as well. Add the wine and cook until it reduces by half. 3,Return the garlic and potatoes to the pan, along with the chicken stock, parsley, oregano, and a pinch of salt and pepper. Transfer to the oven and cook, uncovered, until the chicken is cooked through, about 45 minutes. Add the peas to 
			the pan with 5 minutes left in the cooking time. Serve with the roasting juices in the pan.',
			1000,
			false, false, false, false);


COMMIT;









