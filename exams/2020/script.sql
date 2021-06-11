--
-- File generated with SQLiteStudio v3.2.1 on Tue Sep 15 21:51:05 2020
--
-- Text encoding used: UTF-8
--

-- Table: countries
DROP TABLE IF EXISTS countries;

CREATE TABLE countries (
    id   TEXT PRIMARY KEY,
    name TEXT UNIQUE
);

INSERT INTO countries (
                          id,
                          name
                      )
                      VALUES (
                          'GR',
                          'Greece'
                      );

INSERT INTO countries (
                          id,
                          name
                      )
                      VALUES (
                          'IT',
                          'Italy'
                      );

INSERT INTO countries (
                          id,
                          name
                      )
                      VALUES (
                          'US',
                          'United States'
                      );

INSERT INTO countries (
                          id,
                          name
                      )
                      VALUES (
                          'PT',
                          'Portugal'
                      );


-- Table: doughtypes
DROP TABLE IF EXISTS doughtypes;

CREATE TABLE doughtypes (
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT    UNIQUE
                 NOT NULL
);

INSERT INTO doughtypes (
                           id,
                           name
                       )
                       VALUES (
                           1,
                           'Traditional thin crust'
                       );

INSERT INTO doughtypes (
                           id,
                           name
                       )
                       VALUES (
                           2,
                           'New York style'
                       );

INSERT INTO doughtypes (
                           id,
                           name
                       )
                       VALUES (
                           3,
                           'Pan pizza style'
                       );

INSERT INTO doughtypes (
                           id,
                           name
                       )
                       VALUES (
                           4,
                           'Thick with filling'
                       );


-- Table: ingredients
DROP TABLE IF EXISTS ingredients;

CREATE TABLE ingredients (
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    name       TEXT    UNIQUE
                       NOT NULL,
    vegetarian BOOLEAN,
    allergen   BOOLEAN,
    price      DOUBLE  NOT NULL
);

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            1,
                            'Jalapeno Pepper',
                            1,
                            NULL,
                            2.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            2,
                            'Mozarella',
                            NULL,
                            1,
                            0.75
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            3,
                            'Tomato Sauce',
                            1,
                            NULL,
                            0.75
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            4,
                            'Pepperoni',
                            NULL,
                            NULL,
                            1.5
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            5,
                            'Tofu',
                            1,
                            NULL,
                            2.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            6,
                            'Fresh Mozarella',
                            NULL,
                            1,
                            2.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            7,
                            'Tuna',
                            NULL,
                            NULL,
                            2.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            8,
                            'Smoked Salmon',
                            NULL,
                            NULL,
                            3.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            9,
                            'Shrimp',
                            NULL,
                            1,
                            2.5
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            10,
                            'Arugula',
                            1,
                            NULL,
                            0.75
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            11,
                            'Prosciutto',
                            NULL,
                            NULL,
                            2.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            12,
                            'Smoked Ham',
                            NULL,
                            NULL,
                            2.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            13,
                            'Cashew Nuts',
                            1,
                            1,
                            2.5
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            14,
                            'Garlic Olive Oil',
                            1,
                            NULL,
                            0.5
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            15,
                            'Oregano',
                            1,
                            NULL,
                            0.25
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            16,
                            'Cooked Ham',
                            NULL,
                            NULL,
                            3.0
                        );

INSERT INTO ingredients (
                            id,
                            name,
                            vegetarian,
                            allergen,
                            price
                        )
                        VALUES (
                            17,
                            'Beef meatballs',
                            NULL,
                            NULL,
                            3.0
                        );


-- Table: pizzas
DROP TABLE IF EXISTS pizzas;

CREATE TABLE pizzas (
    id      INTEGER PRIMARY KEY AUTOINCREMENT,
    country INTEGER NOT NULL
                    REFERENCES countries (id),
    name    TEXT    UNIQUE
                    NOT NULL,
    price   DOUBLE  NOT NULL,
    dough   INTEGER REFERENCES doughtypes (id) 
);

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       1,
                       'US',
                       'BIG New Yorker',
                       10.0,
                       2
                   );

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       2,
                       'IT',
                       'Firenze',
                       40.0,
                       1
                   );

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       3,
                       'IT',
                       'Fiorentina',
                       23.0,
                       3
                   );

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       4,
                       'US',
                       'Heart Attack Grill',
                       15.0,
                       4
                   );

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       5,
                       'GR',
                       'Mediterranean',
                       30.0,
                       1
                   );

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       6,
                       'IT',
                       'Caprese',
                       25.0,
                       3
                   );

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       7,
                       'IT',
                       'Veggie Lovers',
                       17.0,
                       1
                   );

INSERT INTO pizzas (
                       id,
                       country,
                       name,
                       price,
                       dough
                   )
                   VALUES (
                       8,
                       'GR',
                       'Athenaii',
                       20.0,
                       3
                   );


-- Table: recipes
DROP TABLE IF EXISTS recipes;

CREATE TABLE recipes (
    pizza      INTEGER REFERENCES pizzas (id),
    ingredient INTEGER REFERENCES ingredients (id),
    PRIMARY KEY (
        pizza,
        ingredient
    )
);

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        13
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        3
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        18
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        1,
                        13
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        16
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        8
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        10
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        13
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        5,
                        15
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        7,
                        10
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        5
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        2
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        3,
                        7
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        1,
                        18
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        9
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        10
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        17
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        18
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        5,
                        8
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        5,
                        14
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        1,
                        4
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        1,
                        1
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        3,
                        2
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        5
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        6
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        5,
                        5
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        7,
                        5
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        5,
                        1
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        5,
                        3
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        3,
                        15
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        7
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        14
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        1,
                        3
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        9
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        12
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        1,
                        12
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        5,
                        10
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        1
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        2,
                        15
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        3,
                        14
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        6,
                        14
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        3,
                        4
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        10
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        4,
                        13
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        7,
                        3
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        7,
                        1
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        8,
                        1
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        8,
                        3
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        8,
                        5
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        8,
                        10
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        8,
                        13
                    );

INSERT INTO recipes (
                        pizza,
                        ingredient
                    )
                    VALUES (
                        8,
                        14
                    );
