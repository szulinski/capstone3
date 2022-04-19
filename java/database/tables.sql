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
	recipe_name varchar (75)  UNIQUE NOT NULL,
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
	CONSTRAINT fk_meal_id FOREIGN KEY (meal_id) REFERENCES meals(meal_id),
	CONSTRAINT fk_plan_id FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
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
			'2 peices of bread, 2 tablespoons of jelly, 1.5 tablespoons of peanut butter ',
			 '1, spead penut butter on bread. 2, spread jelly on bread. 3, cut in half. 4, eat.',
			350, false, true, false, false, false, true, false, 'https://www.wholesomeyum.com/wp-content/uploads/2021/03/wholesomeyum-keto-peanut-butter-and-jelly-sandwich-3.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Sunny-Side up Eggs',
		   '1 tsp olive oil, 2 eggs',
		   '1, Pre-heat pan and oil over medium high heat. 2, Crack both eggs over the pan. 3, Cook 3 minutes, or until white is completely set. Remove from pan and season with salt and pepper.',
		   150, true, true, true, true, true, false, false, 'https://assets.bonappetit.com/photos/58c957546b9097760bea5082/master/w_1280,c_limit/olive-oil-basted-fried-eggs.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium, is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Roasted Chicken And Vegetables',
		   '4 free range organic chicken breasts, 2 1/2 cups big diced potatoes, 1 medium red bell pepper diced, 1 medium orange bell pepper diced, 1 medium green bell pepper diced, 1 small onion diced, 5 garlic cloves, 1 tbsp olive oil, Salt, Pepper',
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

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Egg Omelette',
			'2 large eggs, 1 tablespoon unsalted butter, 2 tablespoons grated cheese,  3 to 4 cherry tomatoes, 2 tablespoons chopped basil ',
			'1, Beat the eggs. 2, Melt the butter. 3, Add the eggs. 4, Fill the omelette. 5, Fold and serve.',
			340, false, true, true, true, true,true, false, 'https://www.simplyrecipes.com/thmb/gZF2-5xBQOjQD8ToXjmUbtLbQJo=/720x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/__opt__aboutcom__coeus__resources__content_migration__simply_recipes__uploads__2018__10__HT-Make-an-Omelet-LEAD-HORIZONTAL-17cd2e469c4a4ccbbd1273a7cae6425c.jpg' );

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Turkey Sandwich',
			'2 slices of toasted bread, Sliced or pulled turkey, 1 tbsp crandberry sauce, 2 tbsp mayo or garlic aoli, 2 oz mozzarella or provalone ',
			'1, Lightly toast the bread. 2, Spread 2 of the slices with mayonnaise. 3, Top with cheese, turkey, lettuce, and tomatoes (optional). Season with salt & pepper if desired. 4, Spread remaining slices of bread with cranberry sauce and top sandwich. ',
			420, false, true, false, true, false, true, false, 'https://www.spendwithpennies.com/wp-content/uploads/2019/11/Turkey-Sandwich-SpendWithPennies-2.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Salmon With Roasted Veggies',
			'1 8oz Salmon filet, 1 head of brocolli, 1 diced potatoes, onion diced, garlic minced, 1 red pepper diced',
			'1, preheat oven to 400F. 2, toss chopped veggies in olive oil, salt, pepper, oregano, smoked paprika, tyme, rosemarry, and any other seasonings you like. 3, place the pan of veggies and slmon on a seporate plan in oven and bake until salmon reaches 130F internal temp, stir veggies occasionally. ',
			475, true, true, true, true, false, false, true, 'https://images-gmi-pmc.edge-generalmills.com/5cdc7032-ca50-4b1d-9210-72d992e5a71f.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Mediterranean Chickpea Salad',
			'1 can of chickpeas,1 medium cucumber, chopped, 1 bell pepper, chopped, 1/2 red onion, thinly sliced, 1/2 c. chopped kalamata olives, 1/2 c. crumbled feta, Lemon Parsley Vinaigrette ',
			'1, In a large bowl, toss together chickpeas, cucumber, bell pepper, red onion, olives, and feta. Season with salt and pepper. 2In a jar fitted with a lid, combine olive oil, vinegar, lemon juice, parsley, and red pepper flakes. Close the jar and shake until emulsified. 3,Dress salad with vinaigrette just before serving. ',
			360, false, true, true, true, false, true, true, 'https://hips.hearstapps.com/vidthumb/images/mediterranean-chickpea-salad-1526077481.png?crop=1xw:1xh;center,top&resize=768:*');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES ('Turkey Burger',
			'Ground turkey, garlic, tomato, red onion, egg, mayo, potatoe buns, lettuce',
			'1, Mix ground turkey with egg and spices. 2, grill buns and burger till done, 3, assemble burger ',
			460, true, false, false, false, false ,true, true, 'https://www.killingthyme.net/wp-content/uploads/2021/11/best-turkey-burger-recipe-5-720x458.jpg');

INSERT INTO recipes (recipe_name, ingredients, directions, calories, is_low_fat, is_high_protein, is_low_carb, is_low_sodium,is_breakfast, is_lunch, is_dinner, img) 
	VALUES (' Stuffed Poblano Peppers ',
			'Poblano peppers, Ground beef, garlic, chili powder, cumin, paprika, red pepper, red onion, Cheddar cheese, cilantro, Pico de gallo',
			'1, Cut peppers in hal and de-seed, 2,Cook ground beef over med-high heat until browned and drain any excess fat. 3,Add chili powder, cumin, paprika, salt, garlic, red pepper and red onion, sauteeing another 2 minutes until veggies are tender. 4, Stuff ground beef mixture into poblano peppers and top with cheese. Bake again until cheese is melted. 5, Remove from oven and add toppings of choice. ',
			490, true,true, false, false, false, true, true, 'data:image/jpeg;base64,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');
			
--select * from recipes

INSERT INTO plans (plan_name) VALUES ( 'high protein');
--SELECT * FROM plans
-SELECT * FROM users

--INSERT INTO user_plan VALUES ((SELECT user_id FROM users WHERE user_id = 3 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
--SELECT * FROM user_plan	
	
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Monday');	
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Monday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Monday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Tuseday');		
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Tuseday');	
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Tuseday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Wednesday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Wednesday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Wednesday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Thursday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Thursday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Thursday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Friday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Friday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Friday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Saturday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Saturday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Saturday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Breakfast', 'Sunday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Lunch', 'Sunday');
INSERT INTO meals (type_of_meal, day_of_week) VALUES ( 'Dinner', 'Sunday');
--SELECT * FROM meals

INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 2 ),(SELECT plan_id FROM plans WHERE plan_id = 1));					  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 3 ),(SELECT plan_id FROM plans WHERE plan_id = 1));									  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 4 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 5 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 6 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 7 ),(SELECT plan_id FROM plans WHERE plan_id = 1));		
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 8 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 9 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 10 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 11 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 12 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 13 ),(SELECT plan_id FROM plans WHERE plan_id = 1));								  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 14 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 15 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 16 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 17 ),(SELECT plan_id FROM plans WHERE plan_id =1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 18 ),(SELECT plan_id FROM plans WHERE plan_id = 1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 19 ),(SELECT plan_id FROM plans WHERE plan_id =1));							  
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 20 ),(SELECT plan_id FROM plans WHERE plan_id =1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 21 ),(SELECT plan_id FROM plans WHERE plan_id =1));
INSERT INTO meal_plan VALUES ((SELECT meal_id FROM meals WHERE meal_id = 22 ),(SELECT plan_id FROM plans WHERE plan_id =1));


INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 2 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 6));					  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 3 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 2));									  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 4 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 1));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 5 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 3));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 6 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 2));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 7 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 4));		
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 8 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 9 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 9));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 10 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 1));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 11 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 3));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 12 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 2));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 13 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 10));								  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 14 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 6));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 15 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 16 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 1));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 17 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 18 ),(SELECT recipe_id FROM recipes WHERE recipe_id = 9));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 19 ),(SELECT recipe_id FROM recipes WHERE recipe_id =7));							  
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 20 ),(SELECT recipe_id FROM recipes WHERE recipe_id =8));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 21 ),(SELECT recipe_id FROM recipes WHERE recipe_id =9));
INSERT INTO meal_recipe VALUES ((SELECT meal_id FROM meals WHERE meal_id = 22 ),(SELECT recipe_id FROM recipes WHERE recipe_id =7));
--SELECT * FROM meal_recipe							  
							  
							  
							  
							  
							  
--INSERT INTO plans (plan_name) VALUES ( 'Cheat Week');




COMMIT;

