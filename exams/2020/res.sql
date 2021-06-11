.mode columns
.headers ON

/* 1. */
select name as pizzaName, price as pizzaPrice
from pizzas
where price > 20
order by price desc;

/* 2. */
select doughtypes.name as doughtype, max(price) as maxPrice, pizzas.name as pizzaName
from pizzas join doughtypes on pizzas.dough = doughtypes.id
group by dough
order by doughtypes.name desc, price desc, pizzas.name asc;

/* 3. */
select pizzas.name as pizzaName, count(recipes.ingredient) as numIngredients
from recipes join pizzas on recipes.pizza = pizzas.id
where recipes.pizza not in (select pizza
                            from recipes join (select id from ingredients except 
                            select id from ingredients where vegetarian = 1) 
                            as vegIngredients on recipes.ingredient = vegIngredients.id)
group by recipes.pizza
order by count(recipes.ingredient) desc, pizzas.name asc;

/* 4. */
select sum(totalPrice)
from (select pizzas.name, pizzas.price + sum(ingredients.price) as totalPrice
      from pizzas, ingredients
      where ingredients.allergen = 1 
            and ingredients.id not in (select ingredient 
                                       from recipes 
                                       where recipes.pizza = pizzas.id)
      group by pizzas.id);

