
INSERT INTO Customer VALUES (1001, 'Arjun Mehta',      'arjun.mehta@email.com',      'Mumbai',    TO_DATE('2022-01-15','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1002, 'Priya Sharma',     'priya.sharma@email.com',     'Delhi',     TO_DATE('2022-03-22','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1003, 'Ravi Kumar',       'ravi.kumar@email.com',       'Bangalore', TO_DATE('2022-06-10','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1004, 'Sneha Patil',      'sneha.patil@email.com',      'Pune',      TO_DATE('2022-08-05','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1005, 'Karan Singh',      'karan.singh@email.com',      'Hyderabad', TO_DATE('2022-09-18','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1006, 'Divya Nair',       'divya.nair@email.com',       'Chennai',   TO_DATE('2022-11-30','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1007, 'Amit Gupta',       'amit.gupta@email.com',       'Kolkata',   TO_DATE('2023-01-07','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1008, 'Neha Joshi',       'neha.joshi@email.com',       'Jaipur',    TO_DATE('2023-02-14','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1009, 'Rohit Verma',      'rohit.verma@email.com',      'Ahmedabad', TO_DATE('2023-04-20','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1010, 'Pooja Reddy',      'pooja.reddy@email.com',      'Hyderabad', TO_DATE('2023-05-11','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1011, 'Saurabh Das',      'saurabh.das@email.com',      'Bhopal',    TO_DATE('2023-06-25','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1012, 'Kavitha Rao',      'kavitha.rao@email.com',      'Bangalore', TO_DATE('2023-07-08','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1013, 'Manish Tiwari',    'manish.tiwari@email.com',    'Lucknow',   TO_DATE('2023-08-19','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1014, 'Swati Agarwal',    'swati.agarwal@email.com',    'Delhi',     TO_DATE('2023-09-03','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1015, 'Deepak Pillai',    'deepak.pillai@email.com',    'Kochi',     TO_DATE('2023-10-17','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1016, 'Ananya Bose',      'ananya.bose@email.com',      'Kolkata',   TO_DATE('2023-11-22','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1017, 'Vijay Menon',      'vijay.menon@email.com',      'Chennai',   TO_DATE('2024-01-09','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1018, 'Isha Kapoor',      'isha.kapoor@email.com',      'Mumbai',    TO_DATE('2024-02-28','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1019, 'Nitin Shetty',     'nitin.shetty@email.com',     'Mangalore', TO_DATE('2024-04-15','YYYY-MM-DD'));
INSERT INTO Customer VALUES (1020, 'Meera Krishnan',   'meera.krishnan@email.com',   'Coimbatore',TO_DATE('2024-06-01','YYYY-MM-DD'));


-- electronic itesm
INSERT INTO Product VALUES (2001, 'wireless bluetooth headphones', 'Electronic',  2499.00, 120);
INSERT INTO Product VALUES (2002, 'USB-C Fast Charge 65W',        'Electronic',   899.00, 300);
INSERT INTO Product VALUES (2003, 'Mechanical Game Keyboard',    'Electronic',  3999.00,  80);
INSERT INTO Product VALUES (2004, 'smart led Desk Lamp',           'Electronic',  1299.00, 200);
INSERT INTO Product VALUES (2005, 'portable Power Bank 20000mAh',  'Electronic',  1799.00, 150);

INSERT INTO Product VALUES (2006, 'Men Slim formal Shirt',  'Clothing',      799.00, 500);
INSERT INTO Product VALUES (2007, 'Women kurta set cotton',     'Clothing',     1199.00, 400);
INSERT INTO Product VALUES (2008, 'Unisex  winter wear',     'Clothing',     1599.00, 350);
INSERT INTO Product VALUES (2009, 'sport RunningShoes',          'Clothing',     2299.00, 200);
INSERT INTO Product VALUES (2010, ' denim jeans',            'Clothing',     1499.00, 300);

INSERT INTO Product VALUES (2011, 'Code by Robert Martin',   'Books',         599.00, 100);
INSERT INTO Product VALUES (2012, ' Programmer',      'Books',         649.00,  90);
INSERT INTO Product VALUES (2013, 'Atomic Habits ',  'Books',         399.00, 200);
INSERT INTO Product VALUES (2014, 'System Design2', 'Books',         749.00,  75);
INSERT INTO Product VALUES (2015, 'DSA',  'Books',         549.00, 110);

INSERT INTO Product VALUES (2016, 'Stainless  Bottle',  'Home & Kitchen', 499.00, 600);
INSERT INTO Product VALUES (2017, ' Cookware Set',    'Home & Kitchen',2199.00, 150);
INSERT INTO Product VALUES (2018, 'ElectricAL Kettle ',          'Home & Kitchen', 899.00, 250);
INSERT INTO Product VALUES (2019, 'Cutting Board Set',      'Home & Kitchen', 349.00, 400);
INSERT INTO Product VALUES (2020, 'Air Fryer',         'Home & Kitchen',4999.00,  60);

INSERT INTO Product VALUES (2021, 'Yoga Mat',        'Sports',         699.00, 300);
INSERT INTO Product VALUES (2022, 'Resistances bands',     'Sports',         449.00, 350);
INSERT INTO Product VALUES (2023, 'Dumbbell Setting',  'Sports',        3499.00,  40);
INSERT INTO Product VALUES (2024, 'Cycling Helmet ',    'Sports',        1999.00,  80);
INSERT INTO Product VALUES (2025, 'Jump Rope ',      'Sports',         299.00, 500);


INSERT INTO Orders VALUES (3001, 1001, TO_DATE('2024-01-05','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3002, 1002, TO_DATE('2024-01-12','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3003, 1003, TO_DATE('2024-01-20','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3004, 1004, TO_DATE('2024-02-03','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3005, 1005, TO_DATE('2024-02-14','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3006, 1001, TO_DATE('2024-02-25','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3007, 1006, TO_DATE('2024-03-08','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3008, 1007, TO_DATE('2024-03-15','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3009, 1002, TO_DATE('2024-03-22','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3010, 1008, TO_DATE('2024-04-01','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3011, 1009, TO_DATE('2024-04-10','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3012, 1010, TO_DATE('2024-04-18','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3013, 1003, TO_DATE('2024-05-02','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3014, 1011, TO_DATE('2024-05-15','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3015, 1001, TO_DATE('2024-05-28','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3016, 1012, TO_DATE('2024-06-05','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3017, 1013, TO_DATE('2024-06-18','YYYY-MM-DD'), 'shipped');
INSERT INTO Orders VALUES (3018, 1004, TO_DATE('2024-06-25','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3019, 1014, TO_DATE('2024-07-04','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3020, 1005, TO_DATE('2024-07-19','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3021, 1015, TO_DATE('2024-07-28','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3022, 1002, TO_DATE('2024-08-06','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3023, 1016, TO_DATE('2024-08-14','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3024, 1001, TO_DATE('2024-08-22','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3025, 1017, TO_DATE('2024-09-03','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3026, 1018, TO_DATE('2024-09-11','YYYY-MM-DD'), 'shipped');
INSERT INTO Orders VALUES (3027, 1003, TO_DATE('2024-09-20','YYYY-MM-DD'), 'delivered');
INSERT INTO Orders VALUES (3028, 1019, TO_DATE('2024-10-02','YYYY-MM-DD'), 'placed');
INSERT INTO Orders VALUES (3029, 1020, TO_DATE('2024-10-15','YYYY-MM-DD'), 'placed');
INSERT INTO Orders VALUES (3030, 1001, TO_DATE('2024-10-28','YYYY-MM-DD'), 'placed');

-- -------------------------
-- Order_item (60 records)
-- -------------------------
INSERT INTO Order_item VALUES (4001, 3001, 2001, 1, 2499.00);
INSERT INTO Order_item VALUES (4002, 3001, 2016, 2,  499.00);
INSERT INTO Order_item VALUES (4003, 3002, 2006, 3,  799.00);
INSERT INTO Order_item VALUES (4004, 3002, 2013, 1,  399.00);
INSERT INTO Order_item VALUES (4005, 3003, 2003, 1, 3999.00);
INSERT INTO Order_item VALUES (4006, 3003, 2011, 1,  599.00);
INSERT INTO Order_item VALUES (4007, 3004, 2017, 1, 2199.00);
INSERT INTO Order_item VALUES (4008, 3004, 2019, 2,  349.00);
INSERT INTO Order_item VALUES (4009, 3005, 2021, 1,  699.00);
INSERT INTO Order_item VALUES (4010, 3005, 2022, 1,  449.00);
INSERT INTO Order_item VALUES (4011, 3005, 2025, 2,  299.00);
INSERT INTO Order_item VALUES (4012, 3006, 2005, 1, 1799.00);
INSERT INTO Order_item VALUES (4013, 3006, 2002, 1,  899.00);
INSERT INTO Order_item VALUES (4014, 3007, 2008, 2, 1599.00);
INSERT INTO Order_item VALUES (4015, 3007, 2009, 1, 2299.00);
INSERT INTO Order_item VALUES (4016, 3008, 2020, 1, 4999.00);
INSERT INTO Order_item VALUES (4017, 3008, 2018, 1,  899.00);
INSERT INTO Order_item VALUES (4018, 3009, 2012, 2,  649.00);
INSERT INTO Order_item VALUES (4019, 3009, 2014, 1,  749.00);
INSERT INTO Order_item VALUES (4020, 3010, 2004, 1, 1299.00);
INSERT INTO Order_item VALUES (4021, 3010, 2016, 3,  499.00);
INSERT INTO Order_item VALUES (4022, 3011, 2023, 1, 3499.00);
INSERT INTO Order_item VALUES (4023, 3011, 2021, 1,  699.00);
INSERT INTO Order_item VALUES (4024, 3012, 2007, 2, 1199.00);
INSERT INTO Order_item VALUES (4025, 3012, 2010, 1, 1499.00);
INSERT INTO Order_item VALUES (4026, 3013, 2001, 1, 2499.00);
INSERT INTO Order_item VALUES (4027, 3013, 2005, 1, 1799.00);
INSERT INTO Order_item VALUES (4028, 3014, 2015, 1,  549.00);
INSERT INTO Order_item VALUES (4029, 3014, 2013, 2,  399.00);
INSERT INTO Order_item VALUES (4030, 3015, 2020, 1, 4999.00);
INSERT INTO Order_item VALUES (4031, 3015, 2016, 1,  499.00);
INSERT INTO Order_item VALUES (4032, 3016, 2009, 1, 2299.00);
INSERT INTO Order_item VALUES (4033, 3016, 2006, 2,  799.00);
INSERT INTO Order_item VALUES (4034, 3017, 2024, 1, 1999.00);
INSERT INTO Order_item VALUES (4035, 3017, 2022, 2,  449.00);
INSERT INTO Order_item VALUES (4036, 3018, 2018, 1,  899.00);
INSERT INTO Order_item VALUES (4037, 3018, 2017, 1, 2199.00);
INSERT INTO Order_item VALUES (4038, 3019, 2011, 1,  599.00);
INSERT INTO Order_item VALUES (4039, 3019, 2012, 1,  649.00);
INSERT INTO Order_item VALUES (4040, 3019, 2015, 1,  549.00);
INSERT INTO Order_item VALUES (4041, 3020, 2021, 2,  699.00);
INSERT INTO Order_item VALUES (4042, 3020, 2025, 3,  299.00);
INSERT INTO Order_item VALUES (4043, 3021, 2003, 1, 3999.00);
INSERT INTO Order_item VALUES (4044, 3021, 2004, 1, 1299.00);
INSERT INTO Order_item VALUES (4045, 3022, 2008, 1, 1599.00);
INSERT INTO Order_item VALUES (4046, 3022, 2010, 2, 1499.00);
INSERT INTO Order_item VALUES (4047, 3023, 2002, 2,  899.00);
INSERT INTO Order_item VALUES (4048, 3023, 2001, 1, 2499.00);
INSERT INTO Order_item VALUES (4049, 3024, 2020, 1, 4999.00);
INSERT INTO Order_item VALUES (4050, 3024, 2019, 2,  349.00);
INSERT INTO Order_item VALUES (4051, 3025, 2014, 1,  749.00);
INSERT INTO Order_item VALUES (4052, 3025, 2011, 2,  599.00);
INSERT INTO Order_item VALUES (4053, 3026, 2007, 3, 1199.00);
INSERT INTO Order_item VALUES (4054, 3026, 2006, 2,  799.00);
INSERT INTO Order_item VALUES (4055, 3027, 2023, 1, 3499.00);
INSERT INTO Order_item VALUES (4056, 3027, 2022, 2,  449.00);
INSERT INTO Order_item VALUES (4057, 3028, 2005, 2, 1799.00);
INSERT INTO Order_item VALUES (4058, 3028, 2002, 1,  899.00);
INSERT INTO Order_item VALUES (4059, 3029, 2013, 3,  399.00);
INSERT INTO Order_item VALUES (4060, 3030, 2001, 1, 2499.00);

COMMIT;
