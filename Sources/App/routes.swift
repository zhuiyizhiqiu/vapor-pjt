import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.post("api", "acronyms") { req -> Future<Acronym> in
        return try req.content.decode(Acronym.self).flatMap(to: Acronym.self) { acronym in
            return acronym.save(on: req)
        }
    }
    
    router.get("hello",String.parameter) { (req) -> String in
        let name = try req.parameters.next(String.self)
        
        return "Hello,\(name)!"
    }
    
    router.get("pjt","zj") { (req) in
        return """
              这波狗粮！
            真的不怪我呀😂
          涛四岁的女票是婧三岁。
"""
    }
    
    // Example of configuring a controller

}
