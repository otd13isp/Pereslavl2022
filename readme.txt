Для запуска проекта необходимо установить сервер. Для простоты будем использовать сервер Apache.
Его установка и запуск выполняются стандартно:
Установка:
# dnf install httpd
Запуск при включении компьютера:
# systemctl enable httpd.service
Запуск:
# systemctl start httpd.service

Для подсоединения к серверу необходима программа для управления файерволом:
Установить пакет system-config-firewall
# dnf install system-config-firewall-base.noarch
и вызвать его 
# firewall-config
Нужно поставить галочку напротив http (Выбрать конфигурацию "Рабочие" или "Постоянная")

В директории /var/www/html/ (или поддиректории этой директории) будет лежать файл plot.html. 
Для него надо установить права доступа. Это проще всего сделать при помощи mc.

Обратим внимание на файл plot.R
Строка
#* @post /plotly
Сообщает о том, что запрос будет осуществляться, например к
http://localhost:8000/plotly методом POST.
Строка 
#* @serializer png list(width = 800, height = 400)
Задает размер возвращаемого изображения

Установка R под Linux выполняется стандартно:
# dnf install R
Установка графической среды разработки RStudio:
# dnf install rstudio-desktop
# dnf install rstudio-server

Запуск R сервера.
Инсталляция в R необходимых пакетов
> install.packages("plumber")
> install.packages("ggplot2")
> install.packages("png")

Загрузка файла plot.R
> r <- plumb("/home/… /plot.R")
Если команда выше выдает ошибку, то попробуйте загрузить plumber вручную
> library(plumber)
Если это не поможет, то установите в Fedora пакеты 
# dnf install libcurl-devel
# dnf install libsodium
# dnf install libsodium-devel
и попробуйте снова выполнить 
> library(plumber)
И загрузите файл plot.R
Запустите сервер R с использованием порта 8000.
> r$run(port=8000)

Запуск из браузера: http://localhost/имя_директории/plot.html
Нажать кнопку "Пуск"
