##1. Identifiera den eller de AIS koder med högst skadegrad, alltså sista siffran.(1-6, 9 är ospec).
##Om det är en skada välj den regionen. 
##Ta bort alla pat utan AIS-koder, dvs första kolumnen med AIS.# Sortera bort alla som är under 3 (Severe). Förstår inte hur man väljer ut en specifik siffra i AIS-koden.
#is_serious <- function(code) {
 # severity <- substr(as.character(test.vec), 8, 8)


#test.vec <- c(854331.5,854331.6,854331.1)
#max(severity, na.rm = FALSE)

#cleaned.data$max.ais <- max(as.numeric(substr(as.character(cleaned.data[1,7:56], 8, 8))))


##Head or neck – including cervical spine - AIS: 1, 2, 3, 6 
##Chest – thoracic spine and diaphragm - 4, thoracic spine hamnar under AIS 6? köra ala spina här.
##Abdomen or pelvic contents – abdominal organs and lumbar spine- AIS 5.
##Extremities or pelvic girdle – pelvic skeleton: AIS 7, 8.
##External - AIS - 9.


##2. Om mer än 1: Är skadorna i samma region enl ISS? Om Inte vilka regioner rör det sig om?


##3. Har någon av dessa regioner mer än en skada med identifierad högsta skadegrad? 
##Isf välj den regionen.


##4. Annars kolla de näst högsta skadegraderna och upprepa processen enligt ovan 
##tills alla får en specifik region.

##5. Om det mot förmodan finns någon patient med exakt lika många skador i olika regioner
##med exakt samma skadegrad (Högst osannolikt) så får vi fundera på hur vi hanterar dem. 
##Förslag är att deras region då blir typ "multiple" eller liknande för lätt identifiering 
##inför framtid.