/*
       Вывести общее количество документoв в коллекции 
*/
tags_count = db.tags.count()
print('tags count: ', tags_count);
/*
        Вывести количество тэгов Adventure в коллекции
*/
adv_count = db.tags.find({"tag_name" : "Adventure"}).count()
print('Adventure" tags count: ', adv_count);
/*
        Вывести топ 3 самых распространенных тэгов
*/
printjson(
        db.tags.aggregate([
                {"$group": {
                                "_id": "$tag_name",
                                "tag_count": { "$sum": 1 }
                           }
                },
                {"$sort": {"tag_count" : -1 }},
                {"limit" 3}
        ])['_batch']
);
