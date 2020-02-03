
# Shelters
mike = Shelter.create(name: "Mike's Shelter", address: "1331 17th Street", city: "Denver", state: "CO", zip: "80202")
meg = Shelter.create(name: "Meg's Shelter", address: "150 Main Street", city: "Hershey", state: "PA", zip: "17033")
boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: "80205")
howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
fantastic_puppers = Shelter.create(name: "Fantastic Puppers", address: "9872 Furry Lane", city: "New York City", state: "NY", zip: "10001")

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

howlin_puppers.pets.create!(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
                          name: 'Artemis',
                          approximate_age: 3,
                          description: "People say I'm a dream",
                          sex: 'Female',
                          adoptable?: false)

fantastic_puppers.pets.create!(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
                              name: 'Tycho',
                              approximate_age: 3,
                              description: "I'm a troublemaker",
                              sex: 'Male',
                              adoptable?: true)

fantastic_puppers.pets.create!(image: "https://images2.minutemediacdn.com/image/upload/c_crop,h_2716,w_4827,x_0,y_314/f_auto,q_auto,w_1100/v1554924989/shape/mentalfloss/istock-627892528.jpg",
                              name: 'Cody',
                              approximate_age: 2,
                              description: "Some call me codeman 9000",
                              sex: 'Male',
                              adoptable?: true)
