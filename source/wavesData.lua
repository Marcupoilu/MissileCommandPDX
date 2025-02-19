-- random time delay / x (tu touches pas) / y (tu touches pas) / Max Count / EnemyType / EnemyData / stop spawn
function createWavesData()
    wavesData =
    {
        {
            Level = 1, -- ENEMIES AVAILABLE : Xwing, EnemySmallTwo, EnemySmallEight, EnemyMediumOne, EnemyLargeOne
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
                    EnemySpawner(math.random(1500,1500), 34, 0, 15, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1500,1500), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(750,750), 34, 0, 10, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(750,750), 34, 0, 15, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(500,500), 34, 0, 5, Xwing, enemiesData.Xwing),
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
                    EnemySpawner(math.random(800,800), 34, 0, 20, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(1500,1500), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(2000,2000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(0,0), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),

                }),
                Wave(--16
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(50,50), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(0,0), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 8, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(50,50), 34, 0, 8, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(0,0), 34, 0, 2, EnemyLargeOne, enemiesData.EnemyLargeOne),

                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(50,50), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(0,0), 34, 0, 3, EnemyLargeOne, enemiesData.EnemyLargeOne),
                })        
            }
        },
        {
            Level = 2, -- ENEMIES AVAILABLE : Xwing, EnemySmallThree, EnemySmallFive, EnemyMediumOne, EnemyMediumThree, EnemyLargeOne
            Name = "Deep Space 2",
            Music = "1",
            Background = gfx.image.new("images/backgrounds/2_bg_deepspace_02"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(250,250), 34, 0, 10, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallTwo, enemiesData.EnemySmallTwo),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(250,250), 34, 0, 5, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemySmallThree, enemiesData.EnemySmallThree),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemySmallFive, enemiesData.EnemySmallFive),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumThree, enemiesData.EnemyMediumThree),

                }),
                Wave(--10
                {
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumThree, enemiesData.EnemyMediumThree),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(250,250), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumThree, enemiesData.EnemyMediumThree),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(250,250), 34, 0, 15, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumThree, enemiesData.EnemyMediumThree),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(2000,2000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(500,500), 34, 0, 7, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 2, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 7, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 2, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(0,0), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),

                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(500,500), 34, 0, 8, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 8, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                })
            }
        },
        {
            Level = 3, -- ENEMIES AVAILABLE : Xwing, EnemySmallSix, EnemySmallEight, EnemyMediumOne, EnemyMediumFour, EnemyLargeTwo
            Name = "Deep Space 3",
            Music = "1",
            Background = gfx.image.new("images/backgrounds/3_bg_deepspace_03"),
            Waves = {
                Wave(--1
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(2000,2000), 34, 0, 5, EnemySmallThree, enemiesData.EnemySmallThree),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, Xwing, enemiesData.Xwing),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),

                }),
                Wave(--10
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(300,300), 34, 0, 1, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(300,300), 34, 0, 5, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 19, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),

                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 2, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
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
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),

                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSix, enemiesData.EnemySmallSix),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallSeven, enemiesData.EnemySmallSeven),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 7, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(100,100), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 3, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 3, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
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
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemySmallFive, enemiesData.EnemySmallFive),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFive, enemiesData.EnemySmallFive),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemySmallThree, enemiesData.EnemySmallThree),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(500,500), 34, 0, 3, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 3, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallThree, enemiesData.EnemySmallThree),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(250,250), 34, 0, 7, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(250,250), 34, 0, 7, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(250,250), 34, 0, 7, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(250,250), 34, 0, 15, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 4, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(250,250), 34, 0, 4, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 2, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 3, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 17, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 3, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 12, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 3, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
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
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 8, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 8, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 6, EnemySmallFour, enemiesData.EnemySmallFour),
                    EnemySpawner(math.random(100,100), 34, 0, 6, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 17, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 3, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 3, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 2, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(250,250), 34, 0, 8, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(250,250), 34, 0, 8, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 7, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 7, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(250,250), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 12, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(250,250), 34, 0, 3, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
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
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemySmallSeven, enemiesData.EnemySmallSeven),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),

                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallSeven, enemiesData.EnemySmallSeven),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 2, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 3, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeThree, enemiesData.EnemyLargeThree),
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
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemySmallEight, enemiesData.EnemySmallEight),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallSix, enemiesData.EnemySmallSix),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeFour, enemiesData.EnemyLargeFour),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 2, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 2, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 2, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 2, EnemyLargeFour, enemiesData.EnemyLargeFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeFour, enemiesData.EnemyLargeFour),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 5, EnemyLargeFour, enemiesData.EnemyLargeFour),
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
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemyMediumOne, enemiesData.EnemyMediumOne),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(500,500), 34, 0, 20, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallThree, enemiesData.EnemySmallThree),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(250,250), 34, 0, 5, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 15, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 20, EnemyLargeFour, enemiesData.EnemyLargeFour),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemyLargeFour, enemiesData.EnemyLargeFour),
                    EnemySpawner(math.random(100,100), 34, 0, 20, EnemyMediumFive, enemiesData.EnemyMediumFive),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(100,100), 34, 0, 8, EnemyLargeFour, enemiesData.EnemyLargeFour),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFive, enemiesData.EnemyMediumFive),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeFour, enemiesData.EnemyLargeFour),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeFour, enemiesData.EnemyLargeFour),
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
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),
                Wave(--2
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),
                Wave(--3
                {
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),
                Wave(--4
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(500,500), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),            
                Wave(--5
                {
                    EnemySpawner(math.random(100,100), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFour, enemiesData.EnemyMediumFour),
                }),
                Wave(--6
                {
                    EnemySpawner(math.random(100,100), 34, 0, 15, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),            
                Wave(--7
                {
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),           
                Wave(--8
                {
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),            
                Wave(--9
                {
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumTwo, enemiesData.EnemyMediumTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                }),
                Wave(--10
                {
                    EnemySpawner(math.random(100,100), 34, 0, 18, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),
                Wave(--11
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),             
                Wave(--12
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                }),            
                Wave(--13
                {
                    EnemySpawner(math.random(100,100), 34, 0, 19, EnemyMediumFour, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),           
                Wave(--14
                {
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumTwo, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),          
                Wave(--15
                {
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumTwo, enemiesData.EnemyMediumFour),
                    EnemySpawner(math.random(100,100), 34, 0, 9, EnemyMediumThree, enemiesData.EnemyMediumThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),
                Wave(--16
                {
                    EnemySpawner(math.random(100,100), 34, 0, 25, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }),             
                Wave(--17
                {
                    EnemySpawner(math.random(100,100), 34, 0, 25, EnemyMediumFive, enemiesData.EnemyMediumFive),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 1, EnemyLargeThree, enemiesData.EnemyLargeThree),
                }), 
                Wave(--18
                {
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeFour, enemiesData.EnemyLargeFour),
                }), 
                Wave(--19
                {
                    EnemySpawner(math.random(500,500), 34, 0, 7, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(500,500), 34, 0, 7, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(500,500), 34, 0, 7, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(1000,1000), 34, 0, 3, EnemyLargeFour, enemiesData.EnemyLargeFour),
                }),
                Wave(--20
                {
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeOne, enemiesData.EnemyLargeOne),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeTwo, enemiesData.EnemyLargeTwo),
                    EnemySpawner(math.random(100,100), 34, 0, 10, EnemyLargeThree, enemiesData.EnemyLargeThree),
                    EnemySpawner(math.random(500,500), 34, 0, 5, EnemyLargeFour, enemiesData.EnemyLargeFour),
                })
            }
        }
    } 
end