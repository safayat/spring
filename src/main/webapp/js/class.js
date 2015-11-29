


    function getObjectProperties(obj){
        var result = [];
        for (var key in obj) {
            if (obj.hasOwnProperty(key)) {
                /* useful code here */
                result.push(key);
            }
        }
        return result;
    }

    function getSections(clazzList){
       var sectionMap = {};
        clazzList.forEach(function(clazz){
            sectionMap[clazz.sectionName] =  clazz.sectionName;
        });
        return getObjectProperties(sectionMap);
    }
    function getClassNames(clazzList){
       var classNameMap = {};
        clazzList.forEach(function(clazz){
            classNameMap[clazz.className] =  clazz.className;
        });
        return getObjectProperties(classNameMap);
    }

    function getShifts(clazzList){
       var shiftMap = {};
        clazzList.forEach(function(clazz){
            shiftMap[clazz.shiftName] =  clazz.shiftName;
        });
        return getObjectProperties(shiftMap);
    }

    function getClazzMap(clazzList){
        var clazzMap = [];
        clazzList.forEach(function(clazz){
            clazzMap[clazz.classId] = clazz;
        });
        return clazzMap;
    }

    function initClazzList(http,url,callBack){
        var classinfo = {};
        http.get(url).success(function(data){
            console.log(data);
            classinfo.classList = data;
            classinfo.sections = getSections(classinfo.classList);
            classinfo.shifts = getShifts(classinfo.classList);

            classinfo.classNames = getClassNames(classinfo.classList);
            classinfo.clazzMap= getClazzMap(classinfo.classList);
            callBack(classinfo);
        },function(data){
            console.log("error");
        });

    }

    function filterClazz(classList, className, sectionName, shiftName){
       return classList.filter(equal,{key:'className',value:className})
            .filter(equal,{key:'sectionName',value:sectionName})
            .filter(equal,{key:'shiftName',value:shiftName})
           .map(function(clazz){
                return clazz.classId;
            });

        function equal(clazz){
            return this['value'] == clazz[this['key']] || this['value'] == undefined;
        }

    }

    function filterClazzById(classList, classId){
        var selectedClazz = undefined;
        classList.forEach(function(clazz){
             if(classId == clazz.classId){
                 selectedClazz = clazz;
             }
        });
        return selectedClazz;
    }





