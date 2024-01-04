flash: flash-tinygo

prepare-gceu:
	go run cmd/main.go -conf=gceu22

flash-gceu: prepare-gceu perform-flash

prepare-gcuk:
	go run cmd/main.go -conf=gcuk22

flash-gcuk: prepare-gcuk perform-flash

prepare-gcus22:
	go run cmd/main.go -conf=gcus22

flash-gcus22: prepare-gcus22 perform-flash

prepare-gcus:
	go run cmd/main.go -conf=gcus23

flash-gcus: prepare-gcus perform-flash

prepare-tinygo:
	go run cmd/main.go -conf=tinygo

flash-tinygo: prepare-tinygo perform-flash

prepare-fosdem:
	go run cmd/main.go -conf=fosdem23

flash-fosdem: prepare-fosdem perform-flash

flash-sambanova:
	go run cmd/main.go -conf=sambanova
	tinygo flash -target gobadge  -ldflags="-X main.YourName='$(NAME)' -X main.YourTitleA1='$(TITLE1)' -X main.YourTitleA2='$(TITLE2)' -X main.YourTitleB1='I like' -X main.YourTitleB2='GenAI' -X main.YourQRText='https://sambanova.ai'" .

flash-atlgo:
	go run cmd/main.go -conf=atlgo
	tinygo flash -target gobadge  -ldflags="-X main.YourName='$(NAME)' -X main.YourTitleA1='$(TITLE1)' -X main.YourTitleA2='$(TITLE2)' -X main.YourTitleB1='ATL Go' -X main.YourTitleB2='Meetup' -X main.YourQRText='https://tinygo.org'" .

perform-flash:
	tinygo flash -size short -target gobadge -ldflags="-X main.YourName='$(NAME)' -X main.YourTitleA1='$(TITLE1)' -X main.YourTitleA2='$(TITLE2)'" .
