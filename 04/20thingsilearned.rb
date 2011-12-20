REPOSITORY = 'https://github.com/vtsenev/ruby-retrospective-1'

# 1. Първоначално използвах each в метода #to_hash в първа задача и
# реших в новото ми решение да го преправя с inject. Въпреки че става
# с един ред код, ми отне около 20 мин докато схвана защо работи,
# както работи и установих, че не разбирам напълно (добре де, изобщо)
# inject(). След доста четене за inject() къде ли не из нета най-
# накрая разбрах какво точно става в блока след inject({}).

# 2. В първото ми решение исках да проверя дали елементите на масива
# наистина са масиви от два елемента. Използвах puts, за да изкарам
# съобщение, ако не са. Сега съм направил същото, но с raise.

# 3. За #subarray_count разгледах няколко от предадените решения.
# Първото беше с for цикъл и изглеждаше точно, както бих го направил
# на java или c. Другото решение, което погледнах използваше each и
# след това slice, което ми се стори по-хитро. В крайна сметка
# използвах решението на Стефан с each_cons и count, за което никога
# нямаше да се сетя и трябваше да разгледам как работят в apidock,
# докато го схвана.

# 4. Докато пишех домашното за първи път, не се справих с втория метод
# (#index_by), отчасти защото се отнесох несериозно и го оставих за
# последния момент, но и защото изобщо не разбирах как да направя
# метода, така че да приема блок. Знаех, че ще е с yield, но нямах
# представа как точно. След като се мъчих с един куп други методи,
# които приемат блок докато писах задачите наново (inject, map,
# include, all...), нещата малко ми се избистриха.

# 5. За #occurences_count онотово разгледах 3 решения. Първото
# използва fetch ето така:
# self.each { |element|# result[element] = result.fetch(element, 0) + 1 }
# където result е хеша, който се връща накрая. Второто решение използва
# inject, моят "любим" метод и е доста кратко. Последното решение е
# решението на Стефан с tap. Въпреки че tap е елементарен и доста
# полезен метод, не бях разбрал какво точно прави на лекциите и после
# забравих за него. Трябваше да погледна в apidock отново и да си
# поиграя с него в pry. Сега съм му фен.

# 6. По-неясното нещо в това решение за мене беше начина, по който се
# извиква конструктура на Hash (чрез блок):
# Hash.new { |hash, key|# 0 }.tap .... 
# Прочетох в apidock за какво иде реч, но не ми стана ясно защо просто
# не го направим така:
# Hash.new(0).tap ....  
# След като по-простия начин програмата мина тестовете, го оставих така.

# 7. Не бях предал второто домашно, когато трябваше, защото отново го
# бях оставил за последния момент и решението ми не минаваше
# тестовете. За да го направя да работи като хората си избрах едно от
# предадените домашни (на Ростислав Георгиев), от което черпех
# вдъхновение (тоест крадях). Имаше нещо в кода му, което ми се стори,
# че липсва. В условието на задачата пише: "Жанрът и поджанрът трябва
# също да дават етикети. Ако една песен е “Jazz, Bebop”, тя трябва да
# получи етикетите jazz и bebop (изцяло малки букви). Ако е само
# “Jazz”, получава само един етикет – jazz." Затова в моя код добавих
# реда:
# @tags |= genre_pair.map(&:strip).map(&:downcase)
# Правейки го, ми се наложи да си припомня от лекцията какво сме
# казали за symbol#to_proc и как се използва.

# 8. Също докато тествах дали този ред прави това, на което се надявах
# установих, че съм започнал да ползвам доста повече pry, за да
# тествам и да си изяснявам какво правят разни изрази.

# 9. Това е по-скоро нещо, което не успях да науча като хората: как да
# използвам Enumerable#all? в контекста на 2ра задача. В решението си
# Здравко Стойчев го е направил много хитро, но с новите стилови
# ограничения не може да има достатъчно влагания и не работи.

# 

# 10. Бях направил трета задача донякъде (без касовата бележка) и с
# много мъки. Построих едва 3 класа - Cart, Inventory и Product, като
# дори не бях сложил нищо в Product освен един initialize. Методите ми
# растяха на обем и се налагаше да правя глупости, за да
# удовлетворяват изискванията (за брой редове и брой символи на ред).
# Въпреки това, през цялото време докато пишех задачата, си мислех, че
# трябва да може да стане без класа Product, който ми се струваше
# празен. Дори не ми хрумна колко по-удачно и лесно би било да има
# много на брой класове - по един за всеки тип купон и промоция. Даже
# си мисля, че след като видях решението на Стефан по време на
# лекцията, придобих малко по-добра представа за обектно орентираното
# програмиране и начините, по които е препоръчително да си построиш
# програмата, за да можеш да я модифицираш лесно в последствие.

# 11. Не знаех, че може да се работи с module-и по този начин, тоест
# да има нещо като class method. Прочетох някъде, че "Modules are
# collections of methods and constants. They cannot generate
# instances.", и не ми беше хрумвало, че може да има класове вътре.
# Също ме озадачи, че модулите Coupon и Promotions дори не бяха
# include-нати в нито един от класовете извън тях и с методите
# self.build() и self.for() сякаш се generate-ват instance-и. Честно
# казано все още не разбирам много добре какво и защо точно става...

# 12. Докато пишех програмата се чудих как да обработвам хешовете,
# които отговарят за промоциите на отделните продукти, но да не ги
# обхождам с each, защото имат само един елемент. Гледах за метод
# Hash#first в apidock, но няма. Има first като метод на Array. Не ми
# хрумна за Enumerable#first.

