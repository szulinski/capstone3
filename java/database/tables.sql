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
	is_high_protein boolean,
	is_low_carb boolean,
	is_low_sodium boolean,
	is_breakfast boolean,
	is_lunch boolean,
	is_dinner boolean,
	img varchar (500),
	CONSTRAINT pk_recipe_id PRIMARY KEY (recipe_id)
	);

DROP SEQUENCE IF EXISTS seq_meal_id;

CREATE SEQUENCE seq_meal_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE;

CREATE TABLE meals(
	meal_id int DEFAULT nextval('seq_meal_id'::regclass) NOT NULL,
	type_of_meal varchar(20),
	day_of_week varchar(10) NOT NULL,
	CONSTRAINT pk_meal_id PRIMARY KEY (meal_id)
	);
	
	

DROP SEQUENCE IF EXISTS seq_plan_id;

CREATE SEQUENCE seq_plan_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE;
  
CREATE TABLE plans(
	plan_id int DEFAULT nextval('seq_meal_id'::regclass) NOT NULL,
	plan_name varchar (100),
	CONSTRAINT pk_plan_id PRIMARY KEY (plan_id)
	);
	

CREATE TABLE meal_plan (
	meal_id int NOT NULL,
	plan_id int NOT NULL,
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
	
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Chicken Vesuvio', 
		  '1/2 cup olive oil, 5 cloves garlic peeled, 2 large russet potatoes, peeled and cut into chunks, 1 3-4 pound chicken, cut into 8 pieces (or 3 pound chicken legs, 3/4 cup white wine, 3/4 cup chicken stock,  3 tablespoons chopped parsley, 1 tablespoon dried oregano, Salt and pepper, 1 cup frozen peas, thawed',
		  '1,Heat an oven to 325°F. In a roasting pan (or a large (14-inch) oven-proof skillet), heat the olive oil over medium until shimmering. Add the potatoes and garlic and cook until golden brown, about 12 minutes. Remove to a plate, leaving behind as much oil as possible. 2,Add the chicken to the skillet, skin-side down. Cook until golden and crisp, then turn and cook the other side until golden as well. Add the wine and cook until it reduces by half. 3,Return the garlic and potatoes to the pan, along with the chicken stock, parsley, oregano, and a pinch of salt and pepper. Transfer to the oven and cook, uncovered, until the chicken is cooked through, about 45 minutes. Add the peas to 
			the pan with 5 minutes left in the cooking time. Serve with the roasting juices in the pan.',
			1000, false, true, false, false, false, false, true, 'https://www.seriouseats.com/thmb/TYQEkM-okEXCCMwWFk3JvSchNoo=/880x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__recipes__images__2011__12__20111215-dt-chicken-vesuvio-primary-e81c59ea0ba74ab38c6722b7802eb0f1.jpg');
			
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Peanut Butter and Jelly',
			'2 peices of bread, 2 tablespoons of jelly, 1.5 tablespoons of penutbuter ',
			 '1, spead penut butter on bread. 2, spread jelly on bread. 3, cut in half. 4, eat.',
			350, false, true, false, false, false, true, false, 'https://www.wholesomeyum.com/wp-content/uploads/2021/03/wholesomeyum-keto-peanut-butter-and-jelly-sandwich-3.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Sunny-Side up Eggs',
		   '1 tsp olive oil, 2 eggs',
		   '1, Pre-heat pan and oil over medium high heat. 2, Crack both eggs over the pan. 3, Cook 3 minutes, or until white is completely set. Remove from pan and season with salt and pepper.',
		   150, true, true, true, true, true, false, false, 'https://assets.bonappetit.com/photos/58c957546b9097760bea5082/master/w_1280,c_limit/olive-oil-basted-fried-eggs.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Roasted Chicken And Vegetables',
		   '4 free range organic chicken breasts, 2 1/2 cups big diced potatoes,1 medium red bell pepper diced, 1 medium orange bell pepper diced, 1 medium green bell pepper diced, 1 small onion diced, 5 garlic cloves, 1 tbsp olive oil, Salt, Pepper',
		   '1, line your baking sheet with aluminum foil or parchment paper. 2, Chop up all of your veggies and arrange them in a single layer on your pan. Drizzle with oil and season with salt and pepper. Then, use a mixing spatula or large spoon to toss the veggies so they are evenly coated. 3, Toss the chicken breasts with oil and spices, then lay them on top of the veggies. Be sure there is plenty of space between each one. As a result, they will all cook evenly. 4, Bake for 20-25 minutes, or until chicken is cooked through. If you’re meal prepping, divide the chicken and vegetables into equal amounts and place into individual containers.',
			500, true, true, true, true, false, true, true, 'https://www.primaverakitchen.com/wp-content/uploads/2020/02/Mediterranean-Roasted-Chicken-Breast-Primavera-Kitchen-3-800x1200.jpg' );


INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner,img) 
	VALUES ('French Onion Soup',
			' 8 Onions, 4 tbsp Butter, 2 Colves Garlic, 7 Cups Beef Broth, 2 tsp Worcestershire Sauce, 2 tbsp Sherry, 2 Sprigs Thyme, 1/4 cup Parmesan Cheese, 4 oz. Provolone Cheese, 4 Slices French Bread',
			'1, Melt the butter in a large, heavy-bottom pan over medium-high heat. Add the onion, stirring to coat with butter. Cook onion until soft and caramelized, about 25 to 30 minutes. 2, Add the garlic and cook 1 minute, until fragrant. Add the sherry, stir and scrape bottom of pan for brown bits, and cook until sherry is evaporated. Now, add the beef broth, thyme and worcestershire sauce. 3,Bring to a simmer, cover and lower heat to maintain a low simmer. Cook for 30 minutes. Season to taste with salt and pepper. 4,  Ladle soup into oven-safe bowls. Top soup with 2 toasts, then 2 slices of provolone and a dusting of parmesan. Place bowls on a baking sheet and heat under the broiler until cheese is melted and bubbling.',
			360, false, false, false, false, false, true, true, 'https://www.mustlovehome.com/wp-content/uploads/2019/10/Classic-French-Onion-Soup-4-600x900.jpg');
			
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Overnight Oats',
			'1/3 cup old-fashioned oats, 1/4 teaspoon ground cinnamon, 1 tbsp chia seeds, 1 tbsp almond butter, 1/2 cup milk of choice, 1/2 cup fruit',
			'1, In a jar or bowl combine old-fashioned oats and cinnamon, chia seeds and nut butter. Add the milk and mix the nut butter into the oats. 2, Top with your fruit of choice. If you used more milk than 1/2 cup and you want your fruit to stay on top, wait to top the oats. 3, Place the lid on the jar and refrigerate overnight.',
			240, true, true, false, true, true, true, false, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-p_0xkiye_670anaFW_mZFf-XkbjddPl2-g&usqp=CAU');
			
INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Garlic Parmesan Zucchini Noodles Pasta',
			'4 medium zucchini, 3 tablespoons extra virgin olive oil, 1 tablespoon minced garlic, 1/4 to 1/2 teaspoon crushed red pepper flakes, depending on how spicy you like the pasta, 2 medium chopped tomatoes, 1/2 cup shredded parmesan cheese, 1 cup basil leaves, torn into pieces, 1 teaspoon cornstarch, 2 teaspoons cold water, Salt, to taste',
			'1, Trim and spiralize the zucchini. 2, Add olive oil, garlic, and the red pepper flakes to a large, deep skillet. Turn to medium heat. When the oil begins to bubble around the garlic, add the zucchini noodles 5 yo 7 minutes. 3, Stir in the tomatoes, basil, and parmesan cheese. Cook for one minute. Use pasta tongs to transfer the noodles, tomatoes, and basil to a serving dish. Leave the liquid in the skillet. 4,Bring the liquid left in the skillet to a simmer and combine cornstarch and cold water in a small bowl then whisk into the simmering liquid. Cook, while whisking until the liquid thickens to a sauce; about 1 minute. 5, Taste the sauce and season with salt. Pour the sauce over the zucchini, tomatoes, and basil. Finish with more parmesan cheese on top',
			200, true, false, true, false, false, true, true, 'https://www.inspiredtaste.net/wp-content/uploads/2016/08/Zucchini-Pasta-Recipe-1.jpg');

INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Tuseday');
			
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Sunday');

INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Friday');

INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 1 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 5));

INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 2 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 6));

INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 3 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 3));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 3 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 7));

INSERT INTO plans (plan_name) VALUES ( 'Tusedays lunch');

INSERT INTO plans (plan_name) VALUES ( 'Weekend meals' );

INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 1 ),(SELECT plan_id FROM plans WHERE plan_id = 4));

INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 3 ),(SELECT plan_id FROM plans WHERE plan_id = 5));


COMMIT;









