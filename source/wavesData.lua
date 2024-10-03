wavesData =
{
    {
        Level = 1,
        Name = "Deep Space",
        Background = gfx.image.new("images/backgrounds/bg_01"),
        Waves = {
            Wave(
            {
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing)
            }),
            Wave(
            {
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing)
            }),
            Wave(
            {
                EnemySpawner(math.random(100,100), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(500,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo)
            }),
            Wave(
            {
                EnemySpawner(math.random(2500,5000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(500,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
            }),            
            Wave(
            {
                EnemySpawner(math.random(400,600), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
            }),
            Wave(
            {
                EnemySpawner(math.random(500,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo)
            }),            
            Wave(
            {
                EnemySpawner(math.random(5000,5000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing)
            }),           
            Wave(
            {
                EnemySpawner(math.random(2500,5000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
            }),            
            Wave(
            {
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing)
            }),
            Wave(
            {
                EnemySpawner(math.random(500,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo)
            }),                
            Wave(
            {
                EnemySpawner(math.random(1500,2500), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo)
            }),             
            Wave(
            {
                EnemySpawner(math.random(500,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo)
            }),            
            Wave(
            {
                EnemySpawner(math.random(5000,5000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing)
            }),           
            Wave(
            {
                EnemySpawner(math.random(2500,5000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
            }),          
            Wave(
            {
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(5000,5000), 34, 0, 3, EnemyMediumOne, enemiesData.EnemyMediumOne),
            }),
            Wave(
            {
                EnemySpawner(math.random(500,1000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo)
            }),             
            Wave(
            {
                EnemySpawner(math.random(500,1000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(3000,3000), 34, 0, 5, EnemyMediumOne, enemiesData.EnemyMediumOne)
            }), 
            Wave(
            {
                EnemySpawner(math.random(100,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(100,500), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(100,500), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
            }), 
            Wave(
            {
                EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                EnemySpawner(math.random(3000,3000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(5000,5000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
            }),
            Wave(
            {
                EnemySpawner(math.random(1000,1000), 34, 0, 1, EnemyLargeOne, enemiesData.EnemyLargeOne),
                EnemySpawner(math.random(3000,3000), 34, 0, nil, EnemySmallEight, enemiesData.EnemySmallEight),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, Xwing, enemiesData.Xwing),
                EnemySpawner(math.random(1000,1000), 34, 0, nil, EnemySmallTwo, enemiesData.EnemySmallTwo),
                EnemySpawner(math.random(5000,5000), 34, 0, nil, EnemyMediumOne, enemiesData.EnemyMediumOne),
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