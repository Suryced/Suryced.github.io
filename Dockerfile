#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines
FROM node:10

# RUN useradd -ms /bin/bash ojdk

# RUN mkdir -p /home/ojdk/app/ && chown -R ojdk:ojdk/home/ojdk/app

RUN mkdir -p /home/node/app/ && chown -R node:node /home/node/app 

# WORKDIR /home/ojdk/app
WORKDIR /home/node/app

COPY package*.json ./
# COPY junit-* ./

USER node

# RUN javac -cp "junit.4.10.jar:." .java
RUN npm install

EXPOSE 8080

COPY --chown=node:node . .

# CMD [ "java", "-cp", "junit-4.10.jar:.", "org.junit.runner.JUnitCore", "TestAdd", "TestSub"]
CMD ["node", "app.js"]