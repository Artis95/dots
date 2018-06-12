Vim�UnDo� <�n���F�����mX���������[pc   ;                                   [�e    _�                             ����                                                                                                                                                                                                                                                                                                                                                             [�c     �         ;      	"log"5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             [�d    �               ;   package normalize       import (   	"encoding/json"   	"fmt"   	"io/ioutil"   "log"   
	"strings"       (	"github.com/stanneman95/logging/shared"   '	"github.com/stanneman95/logging/utils"   )       r// Normalize listens and normalize an incoming log, afterwards it emits the normalized log on the storage exchange   func Normalize() {   2	producer := utils.CreateProducer("storage", true)   7	f, err := ioutil.ReadFile("./normalize/config.config")   	if err != nil {   		fmt.Print(err)   	}   	fileString := string(f)   &	options := strings.Fields(fileString)   	i := 0   	for range options {   		fmt.Println(options[i])   		i++   	}   "	c := utils.CreateConsumer("logs")   	c.Channel.Qos(   		1,     // prefetch count   		0,     // prefetch size   		false, // global   	)       	msgs, err := c.Consume()   	if err == nil {   		forever := make(chan bool)       		go func() {   				i := 0   			for d := range msgs {   				i = i + 1   ;				norm := shared.JSONToNewNormalizedError(string(d.Body))   				norm.Classify()   %				toSend, err := json.Marshal(norm)   				if err != nil {   					fmt.Println(err)   				} else {   0					key := norm.Severity + "." + norm.ErrorType   4					log.Printf("about to send this log on: " + key)   )					producer.SendOnExchange(toSend, key)   				}   			}   		}()       ;		log.Printf(" [*] Waiting for logs. To exit press CTRL+C")   		<-forever   	}   }5��