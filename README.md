# SARAS Builder

It's builder for SARAS (Search and Rescue Assisting System).

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them This builder only work for linux (tested and worked on ubuntu 18.04). 

check your wifi interface. if it's not wlp2s0, open /usr/local/bin/saras/mesh.sh then change all wlp2s0 to your wifi interface. 

```
Give examples
```

### Installing

Run these install instructions after prerequisites were satisfied 

```
sudo git clone https://github.com/ilhamrizk/build.git
cd build
sudo sh saras.sh
```

## Running the tests

this system will run automatically after you've done the installing procedure above. but you can check some criterion below.

### Mesh network service

To check mesh network, ...

```
sudo batctl tg
```

### Influx DB query

This test to check your databases were made or not. on terminal run these command

```
influx
> show databases
```

It's should contain RESPACK1, RESPACK2, RESPACK3, PETS, PETS1

### Systemd Check

```
sudo systemctl status mesh.service
sudo systemctl status saras.service
sudo systemctl status influxdb
```

Make sure those services are "running". if it's not, *wallahua'lam fisshowaf*

## Deployment

Graphical User Interface will run on browser, run this site on your browser

```
localhost:5000
```

## Built With

* [BATMAN Mesh Network](https://www.open-mesh.org/doc/batman-adv/Quick-start-guide.html) - Mesh Netwok
* [batctl](https://rometools.github.io/rome/) -  
* [Influx DB](https://portal.influxdata.com/) - Database Query


## Authors

Tim Action
* **Tutun Juhana** - *Supervisor*
* **Ilham Rizky** - *Developer*
* **David Valianto** - *Gabuter*
* **Edbert Ongko** - *Ini apa lagi*

## License

This project is licensed under the License of ITB
