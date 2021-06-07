select js.id, js.name, js.email
from json_table('{
    "id": 1, 
    "name": "John Doe", 
    "email": "example@example.com"
    }',
    'lax $' columns(
        id dec(1,0) path 'lax $.id',
        name varchar(20) path 'lax $.name',
        email varchar(52) path 'lax $.email'
        )
    ) as js