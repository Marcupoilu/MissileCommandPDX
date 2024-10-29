-- random time delay / x (tu touches pas) / y (tu touches pas) / Max Count / EnemyType / EnemyData / stop spawn

wavesData =
{
    {
        Level = 1,
        Name = "Deep Space",
        Background = gfx.image.new("images/backgrounds/bg_01"),
        Waves = {
            Wave(--1
            {
                EnemySpawner(math.random(500,2000), 34, 0, 15, Xwing, enemiesData.Xwing)
            }),
            Wave(--2
            {
                EnemySpawner(math.random(500,1000), 34, 0, 20, Xwing, enemiesData.Xwing)
            }),
            Wave(--3
            {
                EnemySpawner(math.random(100,1000), 34, 0, 15, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,3000), 34, 0, 5, EnemySmallTwo, enemiesData.EnemySmallTwo),
            }),
            Wave(--4
            {
                EnemySpawner(math.random(100,1000), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(1000,2000), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
            }),            
            Wave(--5
            {
                EnemySpawner(math.random(100,500), 34, 0, nil, Xwing, enemiesData.Xwing),
            }),
            Wave(--6
            {
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
            }),            
            Wave(--7
            {
                EnemySpawner(math.random(100,500), 34, 0, 10, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,5000), 34, 0, 5, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(1000,5000), 34, 0, 5, EnemySmallEight, enemiesData.EnemySmallEight),
            }),           
            Wave(--8
            {
                EnemySpawner(math.random(100,100), 34, 0, 10, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(500,1000), 34, 0, 10, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(500,1000), 34, 0, 10, EnemySmallEight, enemiesData.EnemySmallEight),
            }),            
            Wave(--9
            {
                EnemySpawner(math.random(2000,3000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(500,1000), 34, 0, 20, Xwing, enemiesData.Xwing),
            }),
            Wave(--10
            {
                EnemySpawner(math.random(2000,3000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(100,1000), 34, 0, 30, Xwing, enemiesData.Xwing),
            }),                
            Wave(--11
            {
                EnemySpawner(math.random(1000,3000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(1000,2000), 34, 0, 20, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(1000,2000), 34, 0, 20, EnemySmallEight, enemiesData.EnemySmallEight),
            }),             
            Wave(--12
            {
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
            }),            
            Wave(--13
            {
                EnemySpawner(math.random(1000,5000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
            }),           
            Wave(--14
            {
                EnemySpawner(math.random(100,300), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
            }),          
            Wave(--15
            {
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(5000,5000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
            }),
            Wave(--16
            {
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(2000,3000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),

            }),             
            Wave(--17
            {
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,3000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne),
            }), 
            Wave(--18
            {
                EnemySpawner(math.random(100,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(100,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
            }), 
            Wave(--19
            {
                EnemySpawner(math.random(100,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,2000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
            }),
            Wave(--20
            {
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(100,100), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
            })        
        }
    },
    {
        Level = 2,
        Name = "Orbit",
        Background = gfx.image.new("images/backgrounds/bg_02"),
        Waves = {
            Wave({EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing)}),        
            -- 30
        }
    },
    {
        Level = 3,
        Name = "City",
        Background = gfx.image.new("images/backgrounds/bg_03"),
        Waves = {
            Wave({EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing)}),        
            -- 30
        }
    },
    {
        Level = 4,
        Name = "City2",
        Background = gfx.image.new("images/backgrounds/bg_03"),
        Waves = {
            Wave({EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing)}),        
            -- 30
        }
    },
    {
        Level = 5,
        Name = "City3",
        Background = gfx.image.new("images/backgrounds/bg_03"),
        Waves = {
            Wave({EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing)}),        
            -- 30
        }
    }
} 