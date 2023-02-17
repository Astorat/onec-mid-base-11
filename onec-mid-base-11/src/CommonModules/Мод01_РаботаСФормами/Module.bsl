#Область ПрограммныйИнтерфейс

Процедура ДополнитьФорму(Форма) Экспорт 
	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда 
		ДобавитьПолеКонтактноеЛицо(Форма);
		ДобавитьПоляВДокументЗаказа(Форма);
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Формы.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицо(Форма);
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Формы.ФормаДокумента" Тогда
		ДобавитьПолеКонтактноеЛицо(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоПередСумма(Форма);
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Формы.ФормаДокумента" Тогда
		ВставитьПолеКонтактноеЛицоПередСумма(Форма);

	КонецЕсли;	
 	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПолеКонтактноеЛицо(Форма)
	
	ПолеВставки = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВставки.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВставки.ПутьКДанным = "Объект.Мод01_КонтактноеЛицо";
	

КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоПередСумма(Форма)
	
	ПолеВставки = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВставки.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВставки.ПутьКДанным = "Объект.Мод01_КонтактноеЛицо";

	
КонецПроцедуры

Процедура ДобавитьПоляВДокументЗаказа(Форма)
	
	Группа = Форма.Элементы.Добавить("ГруппаСкидки", Тип("ГруппаФормы"), Форма.Элементы.ГруппаШапкаЛево);
	Группа.Вид = ВидГруппыФормы.ОбычнаяГруппа;
	Группа.Заголовок = "Группа скидки";
	Группа.ОтображатьЗаголовок = Ложь;

	
	ПолеВставки = Форма.Элементы.Добавить("СогласованнаяСкидки", Тип("ПолеФормы"), Форма.Элементы.ГруппаСкидки);
	ПолеВставки.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВставки.ПутьКДанным = "Объект.Мод01_СогласованнаяСкидки";
	ПолеВставки.УстановитьДействие("ПриИзменении", "Мод01_СогласованнаяСкидкиПриИзменении");
	
	Команда = Форма.Команды.Добавить("ПересчитатьТаблицу");
	Команда.Заголовок = "Пересчитать таблицу";
	Команда.Действие = "Мод01_ПересчитатьТаблицу";
	Команда.Картинка = БиблиотекаКартинок.Обновить;
	
	КнопкаФормы = Форма.Элементы.Добавить("КнопкаПересчитатьТаблицу", Тип("КнопкаФормы"), Форма.Элементы.ГруппаСкидки);
	КнопкаФормы.ИмяКоманды = "ПересчитатьТаблицу";
	КнопкаФормы.Вид = ВидКнопкиФормы.ОбычнаяКнопка;
	КнопкаФормы.Отображение = ОтображениеКнопки.КартинкаИТекст;
	
КонецПроцедуры

#КонецОбласти