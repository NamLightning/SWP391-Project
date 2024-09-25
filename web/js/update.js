function updatePickupDistricts() {
                    var province = document.getElementById("province").value;
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "OrderServlet?action=district&province=" + encodeURIComponent(province), true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            document.getElementById("district").innerHTML = xhr.responseText;
                            document.getElementById("commune").innerHTML = "<option value=''>Select Commune</option>";
                        }
                    };
                    xhr.send();
                }

                function updatePickupCommunes() {
                    var district = document.getElementById("district").value;
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "OrderServlet?action=commune&district=" + encodeURIComponent(district), true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            document.getElementById("commune").innerHTML = xhr.responseText;
                        }
                    };
                    xhr.send();
                }

                function updateFinalDistricts() {
                    var province = document.getElementById("finalProvince").value;
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "OrderServlet?action=district&province=" + encodeURIComponent(province), true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            document.getElementById("finalDistrict").innerHTML = xhr.responseText;
                            document.getElementById("finalCommune").innerHTML = "<option value=''>Select Commune</option>";
                        }
                    };
                    xhr.send();
                }

                function updateFinalCommunes() {
                    var district = document.getElementById("finalDistrict").value;
                    var xhr = new XMLHttpRequest();
                    xhr.open("GET", "OrderServlet?action=commune&district=" + encodeURIComponent(district), true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState == 4 && xhr.status == 200) {
                            document.getElementById("finalCommune").innerHTML = xhr.responseText;
                        }
                    };
                    xhr.send();
                }