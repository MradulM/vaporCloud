import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    
    // To get all preferences options
    router.get("preferenceOptions") { req -> String in
        let preferenceOptions: String = """
        [
        {
        "id": 1,
        "name": "Protien",
        "thumbnail": "image_path",
        "desc": "Lorem ipsum text"
        },
        {
        "id": 2,
        "name": "Vitamins",
        "thumbnail": "image_path",
        "desc": "Lorem ipsum text"
        },
        {
        "id": 3,
        "name": "Minerals",
        "thumbnail": "image_path",
        "desc": "Lorem ipsum text"
        },
        {
        "id": 4,
        "name": "Preference 4",
        "thumbnail": "image_path",
        "desc": "Lorem ipsum text"
        },
        {
        "id": 5,
        "name": "Preference 5",
        "thumbnail": "image_path",
        "desc": "Lorem ipsum text"
        }
        ]
        """
        return preferenceOptions
        
    }
    
    // To get all feeds data
    router.get("feeds") { req -> String in
        /*
         TODO:
         created_place: 1/2/3/4 w.r.t. home/ office/ cafe/ hotel
         */
        let feedsData: String = """
        [
        {
        "id": 1,
        "user_name": "Jeniffer Lopez",
        "user_image": "image100.png",
        "user_id": 100,
        "dish_name": "Bhorta",
        "dish_image": "dish1.png",
        "created_at": "2019-04-11 01:30:00 PM",
        "created_place": "home",
        "gender": "F"
        },
        {
        "id": 2,
        "user_name": "Jeniffer Lopez",
        "user_image": "image100.png",
        "user_id": 100,
        "dish_name": "Lemon Tea",
        "dish_image": "dish2.png",
        "created_at": "2019-04-11 09:00:00 AM",
        "created_place": "office",
        "gender": "F"
        },
        {
        "id": 3,
        "user_name": "Tom Cruise",
        "user_image": "image101.png",
        "user_id": 101,
        "dish_name": "Muffins",
        "dish_image": "dish3.png",
        "created_at": "2019-04-10 09:00:00 AM",
        "created_place": "office",
        "gender": "M"
        }
        ]
        """
        return feedsData
    }
    
    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
