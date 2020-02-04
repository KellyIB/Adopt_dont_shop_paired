
# Shelters
mike = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street",
                      city: "Denver", state: "CO", zip: "80202")
meg = Shelter.create(name: "Meg's Shelter", address: "150 Main Street",
                      city: "Hershey", state: "PA", zip: "17033")
boulder_rescue = Shelter.create(name: "Boulder Rescue",
                                address: "2712 Slobbery Circle",
                                city: "Boulder", state: "CO", zip: "80205")
howlin_puppers = Shelter.create(name: "Howlin' Puppers",
                                address: "7943 Puppers Drive",
                                city: "Falcon", state: "CO", zip: "80207")
fantastic_puppers = Shelter.create(name: "Fantastic Puppers",
                                  address: "9872 Furry Lane",
                                  city: "NY City", state: "NY", zip: "10001")
older_angels = Shelter.create(name: "Older Angels",
                              address: "32 S. Moving Street",
                              city: "Silver Springs", state: "Colorado",
                              zip: "80302")
chewys = Shelter.create(name: "Chewy's", address: "396 Petsy Road",
                        city: "Phoenix", state: "Arizona", zip: "85004")
second_chances = Shelter.create(name: "Second Chances",
                                address: "873 Filmore Ave.",
                                city: "Colorado Springs", state: "Colorado",
                                zip: "80915")
feline_friends = Shelter.create(name: "Feline Friends",
                                address: "123 Pickme Road", city: "Phoenix",
                                state: "Arizona", zip: "85016")
good_dogs = Shelter.create(name: "Good Dogs", address: "4976 Best Friends Ave.",
                           city: "Seattle", state: "Washington", zip: "98016")
pretty_good_pets = Shelter.create(name: "Pretty Good Pets",
                                  address: "87 Lower Expectations St.",
                                  city: "Mediocre", state:"Maine", zip: "04005")
# Pets
mike.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
                name: 'Athena',
                approximate_age: 1,
                description: "Butthead",
                sex: 'Female',
                adoptable?: true)

meg.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
                name: 'Odell',
                approximate_age: 4,
                description: "good dog",
                sex: 'Male',
                adoptable?: true)

howlin_puppers.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
                          name: 'Rue',
                          approximate_age: 1,
                          description: "I'm a doggo",
                          sex: 'Female',
                          adoptable?: true)

howlin_puppers.pets.create(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
                          name: 'Artemis',
                          approximate_age: 3,
                          description: "People say I'm a dream.",
                          sex: 'Female',
                          adoptable?: false)

fantastic_puppers.pets.create(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
                              name: 'Tycho',
                              approximate_age: 3,
                              description: "I'm a troublemaker",
                              sex: 'Male',
                              adoptable?: true)

fantastic_puppers.pets.create(image: "https://images2.minutemediacdn.com/image/upload/c_crop,h_2716,w_4827,x_0,y_314/f_auto,q_auto,w_1100/v1554924989/shape/mentalfloss/istock-627892528.jpg",
                              name: 'Cody',
                              approximate_age: 2,
                              description: "Some call me codeman 9000",
                              sex: 'Male',
                              adoptable?: true)
older_angels.pets.create(image: "https://i.ytimg.com/vi/3dcli9i_pvA/hqdefault.jpg",
                          name: "Zelda",
                          description: "Golden Retriever with a great smile.",
                          approximate_age:  11,
                          sex: "Female",
                          adoptable?: true)
older_angels.pets.create(image: "https://i.barkpost.com/wp-content/uploads/2015/10/reddit-dog-jokes-20.jpg?q=70&fit=crop&crop=entropy&w=808&h=808",
                          name: "Taylor",
                          description: "Chocolate Lab Mix. Loves Cake.",
                          approximate_age: 10,
                          sex: "Female",
                          adoptable?: true)
second_chances.pets.create(image: "https://www.australian-shepherd-lovers.com/image-files/dog-chewing.jpg",
                          description: "Australian Shephard.  Has mild separation anxiety.  May need to be crated when alone.",
                          name: "Pac Man",
                          approximate_age:  4,
                          sex: "Male",
                          adoptable?: true)
good_dogs.pets.create(image: "https://static.boredpanda.com/blog/wp-content/uploads/2016/09/dogs-catching-treats-fotos-frei-schnauze-christian-vieler-66-57e8d9d0ec7ee__880.jpg",
                          name: "Goofy",
                          approximate_age:  3,
                          description: "Hound Mix. Well trained in basic commands. Will catch treats.",
                          adoptable?: true)
