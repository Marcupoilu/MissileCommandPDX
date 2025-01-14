-- random time delay / x (tu touches pas) / y (tu touches pas) / Max Count / EnemyType / EnemyData / stop spawn
function createWavesData()
    wavesData =
    {
        {
            Level = 1, -- ENEMIES AVAILABLE : Xwing, EnemySmallTwo, EnemySmallEight, EnemyMediumOne
            Name = "Deep Space 1",
            Music = "1",
            Background = gfx.image.new("images/backgrounds/1_bg_deepspace_01"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, Xwing, enemiesData.Xwing)
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, Xwing, enemiesData.Xwing)
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(1500,1500), 34, 0, 15, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 15, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(750,750), 34, 0, 15, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(750,750), 34, 0, 15, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(400,400), 34, 0, 15, EnemySmallTwo, enemiesData.EnemySmallTwo)
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemySmallEight, enemiesData.EnemySmallEight),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(400,400), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 2, EnemySmallEight, enemiesData.EnemySmallEight),
                    
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 2, EnemySmallEight, enemiesData.EnemySmallEight),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(800,800), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(1500,1500), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(2000,2000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(2000,2000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemyLargeOne, enemiesData.EnemyLargeOne),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemyLargeOne, enemiesData.EnemyLargeOne),
                })        
            }
        },
        {
            Level = 2, -- ENEMIES AVAILABLE : Xwing, EnemySmallFour, EnemySmallFive, EnemyMediumOne
            Name = "Deep Space 2",
            Music = "1",
            Background = gfx.image.new("images/backgrounds/2_bg_deepspace_02"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1500,1500), 34, 0, 10, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 30, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                })
            }
        },
        {
            Level = 3, -- ENEMIES AVAILABLE : EnemySmallThree, EnemySmallFive, EnemyMediumTwo, EnemyMediumFive, EnemyLargeOne
            Name = "Deep Space 3",
            Music = "1",
            Background = gfx.image.new("images/backgrounds/3_bg_deepspace_03"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 30, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyLargeOne),

                })
            }
        },
        {
            Level = 4, -- ENEMIES AVAILABLE : Xwing, EnemySmallThree, EnemySmallFive, EnemyMediumTwo, EnemyMediumOne, EnemyMediumThree, EnemyMediumFive, EnemyLargeOne
            Name = "Orbit 1",
            Music = "2",
            Background = gfx.image.new("images/backgrounds/4_bg_orbit_01"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 29, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                })
            }
        },
        {
            Level = 5,
            Name = "Orbit 2",
            Music = "2",
            Background = gfx.image.new("images/backgrounds/5_bg_orbit_02"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 29, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                })
            }
        },
        {
            Level = 6,
            Name = "Orbit 3",
            Music = "2",
            Background = gfx.image.new("images/backgrounds/6_bg_orbit_03"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 29, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                })
            }
        },
        {
            Level = 7,
            Name = "City 1",
            Music = "3",
            Background = gfx.image.new("images/backgrounds/7_bg_city_01"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 29, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                })
            }
        },
        {
            Level = 8,
            Name = "City 2",
            Music = "3",
            Background = gfx.image.new("images/backgrounds/8_bg_city_02"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 29, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                })
            }
        },
        {
            Level = 9,
            Name = "City 3",
            Music = "3",
            Background = gfx.image.new("images/backgrounds/9_bg_city_03"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 29, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                })
            }
        },
        {
            Level = 10,
            Name = "HQ",
            Music = "4",
            Background = gfx.image.new("images/backgrounds/10_bg_hq"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(2000,2000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(300,300), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(300,300), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(500,500), 34, 0, 29, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(3000,3000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 30, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(2000,2000), 34, 0, nil, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFour, enemiesData.EnemySmallFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                })
            }
        }
    } 
end