# rack_mini_app

Это мини Rack приложение возвращает текущую дату и время по запросу.
Для того, чтоб им воспользоваться просто отправьте GET-запрос на сервер в формате /time?format=year%2Cmonth%2Cday hour minute second
Параметры, которые можно указать в запросе : year (год), month (месяц), day (день), hour (час), minute (минута), second (секунда).